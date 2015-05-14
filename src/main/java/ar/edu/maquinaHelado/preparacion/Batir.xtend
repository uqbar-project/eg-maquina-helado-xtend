package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado

class Batir extends Paso {
	
	int minutos
	
	new(int cuantosMinutos) {
		minutos = cuantosMinutos
	}
	
	override ejecutar(MaquinaHelado maquina) {
		maquina.batir()
		(1..minutos * 60000).forEach [ ]
		maquina.detenerPaletas
	}
	
	
}