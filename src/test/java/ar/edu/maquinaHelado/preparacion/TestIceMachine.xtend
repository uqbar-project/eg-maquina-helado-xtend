package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestIceMachine {
	
	IceMachine2000 iceMachine
	
	@Before
	def void init() {
		iceMachine = new StubIceMachine(10)	
	}
	
	@Test
	def void siLaEnfrioMuchoDeGolpeQuedaEnError() {
		iceMachine.setValue(MaquinaHelado.SENSOR_TEMPERATURA, -2)
		Assert.assertEquals(MaquinaHelado.MAQUINA_ERROR, iceMachine.status)
		Assert.assertEquals(10, iceMachine.getValue(MaquinaHelado.SENSOR_TEMPERATURA))
	}
	
	@Test
	def void siSeteoUnValorIncorrectoQuedaEnError() {
		iceMachine.setValue(222, -1)
		Assert.assertEquals(MaquinaHelado.MAQUINA_ERROR, iceMachine.status)
		Assert.assertEquals(10, iceMachine.getValue(MaquinaHelado.SENSOR_TEMPERATURA))
	}
	
}