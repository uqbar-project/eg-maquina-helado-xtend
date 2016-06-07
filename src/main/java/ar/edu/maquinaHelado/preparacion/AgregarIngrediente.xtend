package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import ar.edu.maquinaHelado.ingredientes.IngredienteNecesario

class AgregarIngrediente extends Paso {
	
	Ingrediente ingrediente
	int cantidad
	
	new(Ingrediente unIngrediente, int unaCantidad) {
		ingrediente = unIngrediente
		cantidad = unaCantidad
	}
	
	override ejecutar(MaquinaHelado maquina) {
		maquina.agregarIngrediente(ingrediente, cantidad)		
	}

	override ingredienteNecesario() {
		#[new IngredienteNecesario(cantidad, ingrediente)]
	}
	
}