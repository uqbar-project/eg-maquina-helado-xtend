package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.ingredientes.IngredienteNecesario
import java.util.List

abstract class Paso {
	
	def void ejecutar(MaquinaHelado maquina)
	
	def List<IngredienteNecesario> ingredienteNecesario() {
		newArrayList
	}
	
}