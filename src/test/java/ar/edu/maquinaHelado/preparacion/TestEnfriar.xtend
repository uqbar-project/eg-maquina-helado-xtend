package ar.edu.maquinaHelado.preparacion

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestEnfriar extends AbstractTestPreparacion {
	
	EnfriarHasta enfriarHasta5
	
	@Before
	def void initPaso() {
		enfriarHasta5 = new EnfriarHasta(5)
	}
	
	@Test
	def void enfriarA5GradosLoDejaEn5Grados() {
		Assert.assertNotEquals(5, maquina.temperatura)
		enfriarHasta5.ejecutar(maquina)
		Assert.assertEquals(5, maquina.temperatura)
	}

	@Test(expected=Exception)
	def void enfriarA5CuandoLaMaquinaEstaMuyFriaTiraError() {
		enfriarHasta5.ejecutar(maquinaMuyFria)
	}
	
}