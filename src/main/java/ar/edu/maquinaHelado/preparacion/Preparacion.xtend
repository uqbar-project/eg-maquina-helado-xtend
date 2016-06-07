package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import static extension ar.edu.utils.NumberUtils.*

@Accessors
class Preparacion {
	
	int temperaturaMinima
	int temperaturaMaxima
	List<Paso> pasos = new ArrayList<Paso>
	
	def temperaturaAdecuada(int temperatura) {
		temperatura.between(temperaturaMinima, temperaturaMaxima)
	}

	def void preparar(MaquinaHelado maquina) {
		pasos.forEach [ paso | 
			maquina.validarEstado 
			paso.ejecutar(maquina)
		]		
	}
	
	def agregarPaso(Paso paso) {
		this.pasos.add(paso)
	}
	
	def sinPasos() {
		this.pasos.isEmpty
	}
	
	def ingredientesNecesarios() {
		pasos.fold(newArrayList, [ total, paso | 
			total.addAll(paso.ingredienteNecesario) 
			total
		])
	}
	
}
