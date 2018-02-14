package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.exceptions.BusinessException

class EnfriarHasta extends Paso {
	
	int temperaturaDeseada
	
	new(int temperatura) {
		temperaturaDeseada = temperatura
	}
	
	override ejecutar(MaquinaHelado maquina) {
		if (maquina.temperatura < temperaturaDeseada) {
			throw new BusinessException("La máquina está más fría que " + temperaturaDeseada + "°C")
		}
		while (maquina.temperatura > temperaturaDeseada) {
			maquina.enfriar
		}
	}
	
}