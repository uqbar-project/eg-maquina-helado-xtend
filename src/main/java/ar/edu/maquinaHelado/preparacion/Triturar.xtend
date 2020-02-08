package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado

class Triturar extends Paso {
	
	int minutos
	
	new(int cuantosMinutos) {
		minutos = cuantosMinutos
	}
	
	override ejecutar(MaquinaHelado maquina) {
		maquina.triturar()
		esperar(minutos)
		maquina.detenerPaletas
	}
	
	
}