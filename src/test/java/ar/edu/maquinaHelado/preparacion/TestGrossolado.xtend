package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.creacionales.PreparacionBuilder
import ar.edu.maquinaHelado.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestGrossolado extends AbstractTestPreparacion {
	
	Preparacion grossolado
	Preparacion vacia
	
	@Before
	def void initPreparacion() {
		grossolado = new PreparacionBuilder()
			.enfriarHasta(5)
			.agregar(200, leche)
			.agregar(20, azucar)
			.batir(10)
			.enfriar(3)
			.agregar(30, chocolate)
			.triturar(2)
			.enfriarHasta(0)
			.build
	}
	
	@Test
	def void testPreparacionOk() {
		val cuantoChocolate = maquina.stock(chocolate)
		maquina.preparar(grossolado)
		Assert.assertEquals(cuantoChocolate - 30, maquina.stock(chocolate))
	}

	@Test(expected=BusinessException)
	def void testPreparacionVaciaDaError() {
		vacia = new PreparacionBuilder()
			.build
	}
	
}