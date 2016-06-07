package ar.edu.maquinaHelado.ingredientes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteNecesario {
	int cantidadNecesaria
	Ingrediente ingrediente
	
	new(int _cantidad, Ingrediente _ingrediente) {
		cantidadNecesaria = _cantidad
		ingrediente = _ingrediente
	}
	
}