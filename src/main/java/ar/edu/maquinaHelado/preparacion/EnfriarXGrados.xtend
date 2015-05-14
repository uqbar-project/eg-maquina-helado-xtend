package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.exceptions.BusinessException

class EnfriarXGrados extends Paso {
	
	int grados
	
	new(int cuantosGrados) {
		grados = cuantosGrados
	}
	
	override ejecutar(MaquinaHelado maquina) {
		(1..grados).forEach [
			maquina.enfriar
			if (maquina.estaEnError) {
				throw new BusinessException("Hubo un error al enfriar la maquina de helado")
			}
		] 
	}
	
}