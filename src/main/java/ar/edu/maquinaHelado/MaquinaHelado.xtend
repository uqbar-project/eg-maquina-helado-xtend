package ar.edu.maquinaHelado

import ar.edu.maquinaHelado.exceptions.BusinessException
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import ar.edu.maquinaHelado.preparacion.Preparacion
import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MaquinaHelado {

	public static int ACTION_BATIR = 1 as byte
	public static int ACTION_TRITURAR = 2 as byte
	public static int ACTION_AGITAR = 3 as byte
	public static int ACTION_DETENER = 4 as byte

	public static int MAQUINA_OCUPADA = 0 as byte
	public static int MAQUINA_LIBRE = 1 as byte
	public static int MAQUINA_ERROR = 2 as byte

	public static int SENSOR_TEMPERATURA = 1 as byte

	IceMachine2000 iceMachine
	Map<Ingrediente, Integer> stockIngredientes

	new() {
		stockIngredientes = new HashMap<Ingrediente, Integer>
	}
	
	new(IceMachine2000 machine2000) {
		this()
		iceMachine = machine2000
	}

	def void preparar(Preparacion preparacion) {
		this.validarEstadoParaPreparar(preparacion)
		preparacion.preparar(this)
	}

	def void validarEstadoParaPreparar(Preparacion preparacion) {
		if (!estaLibre) {
			throw new BusinessException("La máquina está preparando otro helado")
		}
		if (!preparacion.temperaturaAdecuada(this.temperatura)) {
			throw new BusinessException("La máquina no está a la temperatura adecuada: " + this.temperatura)
		}
		preparacion.ingredientesNecesarios.forEach [ ingNec | stockSuficiente(ingNec.ingrediente, ingNec.cantidadNecesaria)]
	}

	def void validarEstado() {
		if (this.estaEnError) {
			throw new BusinessException("La máquina quedó con error")			
		}
	}

	def estaLibre() {
		iceMachine.status == MAQUINA_LIBRE
	}

	def getTemperatura() {
		iceMachine.getValue(SENSOR_TEMPERATURA)
	}

	def estaEnError() {
		iceMachine.status == MAQUINA_ERROR
	}

	def estaOcupada() {
		iceMachine.status == MAQUINA_OCUPADA
	}

	def enfriar() {
		iceMachine.setValue(SENSOR_TEMPERATURA, -1)
		this.validarEstado()
	}

	def calentar() {
		iceMachine.setValue(SENSOR_TEMPERATURA, 1)
	}

	def agregarIngrediente(Ingrediente ingrediente, int cantidad) {
		this.stockSuficiente(ingrediente, cantidad)
		iceMachine.add(ingrediente.codigo, cantidad)
		if (!this.estaEnError) {
			this.descontarStock(ingrediente, cantidad)
		}
	}

	def stockSuficiente(Ingrediente ingrediente, int cantidad) {
		if (stock(ingrediente) < cantidad) {
			throw new BusinessException("No hay suficiente stock de " + ingrediente + ". Stock actual: " + stock(ingrediente) + " vs. cantidad " + cantidad)
		}
	}

	def stock(Ingrediente ingrediente) {
		stockIngredientes.get(ingrediente) ?: 0
	}

	def descontarStock(Ingrediente ingrediente, int cantidad) {
		val cantidadActual = stock(ingrediente) - cantidad
		stockIngredientes.put(ingrediente, cantidadActual)
	}

	def batir() {
		iceMachine.action(ACTION_BATIR)
	}

	def agitar() {
		iceMachine.action(ACTION_AGITAR)
	}

	def triturar() {
		iceMachine.action(ACTION_TRITURAR)
	}

	def detenerPaletas() {
		iceMachine.action(ACTION_DETENER)
	}

	def ingresarIngrediente(Ingrediente ingrediente, int cantidad) {
		stockIngredientes.put(ingrediente, cantidad)
	}

}
