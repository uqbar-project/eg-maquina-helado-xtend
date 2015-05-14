package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.ingredientes.Ingrediente
import ar.edu.maquinaHelado.MaquinaHelado

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
	
}