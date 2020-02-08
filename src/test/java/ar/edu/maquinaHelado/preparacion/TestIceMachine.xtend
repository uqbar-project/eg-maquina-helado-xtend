package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dada una Ice Machine 2000")
class TestIceMachine {
	
	IceMachine2000 iceMachine
	
	@BeforeEach
	def void init() {
		iceMachine = new StubIceMachine(10)	
	}
	
	@Test
	@DisplayName("si se intenta enfriar demasiado queda en error")
	def void siLaEnfrioMuchoDeGolpeQuedaEnError() {
		iceMachine.setValue(MaquinaHelado.SENSOR_TEMPERATURA, -2)
		assertEquals(MaquinaHelado.MAQUINA_ERROR, iceMachine.status)
		assertEquals(10, iceMachine.getValue(MaquinaHelado.SENSOR_TEMPERATURA))
	}
	
	@Test
	@DisplayName("si se quiere cambiar una configuración que no existe queda en error")
	def void siSeteoUnValorIncorrectoQuedaEnError() {
		iceMachine.setValue(222, -1)
		assertEquals(MaquinaHelado.MAQUINA_ERROR, iceMachine.status)
		assertEquals(10, iceMachine.getValue(MaquinaHelado.SENSOR_TEMPERATURA))
	}
	
}