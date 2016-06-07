package ar.edu.maquinaHelado.creacionales

import ar.edu.maquinaHelado.exceptions.BusinessException
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import ar.edu.maquinaHelado.preparacion.AgregarIngrediente
import ar.edu.maquinaHelado.preparacion.Batir
import ar.edu.maquinaHelado.preparacion.EnfriarHasta
import ar.edu.maquinaHelado.preparacion.EnfriarXGrados
import ar.edu.maquinaHelado.preparacion.Preparacion
import ar.edu.maquinaHelado.preparacion.Triturar

class PreparacionBuilder {
	
	Preparacion preparacion
	
	new() {
		preparacion = new Preparacion => [
			temperaturaMinima = -10
			temperaturaMaxima = 30
		]
	}
	
	def PreparacionBuilder enfriarHasta(int temp) {
		preparacion.agregarPaso(new EnfriarHasta(temp))
		this
	}
	
	def PreparacionBuilder enfriar(int temp) {
		preparacion.agregarPaso(new EnfriarXGrados(temp))
		this
	}
	
	def PreparacionBuilder agregar(int cuanto, Ingrediente ingrediente) {
		preparacion.agregarPaso(new AgregarIngrediente(ingrediente, cuanto))
		this
	}
	
	def batir(int cuanto) {
		preparacion.agregarPaso(new Batir(cuanto))
		this
	}

	def triturar(int cuanto) {
		preparacion.agregarPaso(new Triturar(cuanto))
		this
	}
	
	def build() {
		if (preparacion.sinPasos) {
			throw new BusinessException("No ha definido pasos para la preparacion")
		}
		preparacion
	}
	
}