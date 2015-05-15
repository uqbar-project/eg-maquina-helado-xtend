package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import java.util.HashMap
import java.util.Map

/**
 * Implementación para testear la Ice Machine 2000
 */
class StubIceMachine implements IceMachine2000 {
	
	int temperatura
	int estado
	Map<Integer, Integer> stock
	
	new() {
		this(0) 	
	}
	
	new(int unaTemperatura) {
		estado = MaquinaHelado.MAQUINA_LIBRE
		temperatura = unaTemperatura
		stock = new HashMap<Integer, Integer>
	}
	
	def void simularOcupada() {
		estado = MaquinaHelado.MAQUINA_OCUPADA
	}
	
	def void simularError() {
		estado = MaquinaHelado.MAQUINA_ERROR
	}
	
	override action(int actionCode) {
		// Oh sí, estoy haciendo eso que me pidió señor
	}
	
	override add(int ingredientCode, int amount) {
		var originalAmount = stock.get(ingredientCode)
		if (originalAmount == null) {
			originalAmount = 0
		}
		stock.put(ingredientCode, originalAmount + amount)
	}
	
	override getStatus() {
		estado
	}
	
	override getValue(int code) {
		switch (code) {
			case (MaquinaHelado.SENSOR_TEMPERATURA): {
				return temperatura
			} 
			default: {
				return 0
			} 
		}
	}
	
	override setValue(int code, int value) {
		if ((value != -1 && value != 1) || (code != MaquinaHelado.SENSOR_TEMPERATURA)) {
			simularError
			return
		}  
		temperatura += value
	}

}
