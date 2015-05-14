package ar.edu.maquinaHelado.creacionales

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.exceptions.BusinessException
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import java.util.HashMap
import java.util.Map

class MaquinaHeladoBuilder {
	
	Map<Ingrediente, Integer> bufferStocks
	MaquinaHelado maquina
	
	new() {
		maquina = new MaquinaHelado
		bufferStocks = new HashMap<Ingrediente, Integer>	
	}
	
	def MaquinaHeladoBuilder withIceMachine(IceMachine2000 iceMachine) {
		maquina.iceMachine = iceMachine
		this
	}
	
	def MaquinaHeladoBuilder ingresarIngrediente(Ingrediente ingrediente, Integer cantidad) {
		bufferStocks.put(ingrediente, cantidad)
		this
	}
	
	def MaquinaHelado build() {
		maquina.stockIngredientes = bufferStocks
		if (maquina.iceMachine == null) {
			throw new BusinessException("No puede ingresar una máquina de helado sin su correspondiente Ice Machine")
		}
		if (bufferStocks.isEmpty) {
			throw new BusinessException("Debe ingresar ingredientes para poder hacer una preparación")
		}
		maquina
	}
	
}