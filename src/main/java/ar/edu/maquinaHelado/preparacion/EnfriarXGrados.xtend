package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado

class EnfriarXGrados extends Paso {
	
	int grados
	
	new(int cuantosGrados) {
		grados = cuantosGrados
	}
	
	override ejecutar(MaquinaHelado maquina) {
		(1..grados).forEach [
			maquina.enfriar
			maquina.validarEstado		
		] 
	}
	
}