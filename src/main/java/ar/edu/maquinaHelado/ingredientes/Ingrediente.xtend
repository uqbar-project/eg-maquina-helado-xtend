package ar.edu.maquinaHelado.ingredientes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {
	
	String nombre
	int codigo
	
	new(String unNombre, int unCodigo) {
		nombre = unNombre
		codigo = unCodigo
	}
	
	override toString() {
		nombre
	}
	
}