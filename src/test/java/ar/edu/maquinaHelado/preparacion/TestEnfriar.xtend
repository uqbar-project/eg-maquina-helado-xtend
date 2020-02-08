package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.exceptions.BusinessException
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotEquals
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Al enfriar una máquina hasta una cierta temperatura")
class TestEnfriar {
	
	IceMachine2000 stubIceMachine
	EnfriarHasta enfriarHasta5
	MaquinaHelado maquinaATemperaturaMayor
	MaquinaHelado maquinaATemperaturaMenor

	@BeforeEach
	def void initPaso() {
		stubIceMachine = new StubIceMachine(15)
		enfriarHasta5 = new EnfriarHasta(5)
		maquinaATemperaturaMayor = new MaquinaHelado(stubIceMachine)
		maquinaATemperaturaMenor = new MaquinaHelado(new StubIceMachine(-2))
	}
	
	@Test
	@DisplayName("una máquina que está a mayor temperatura baja hasta la temperatura deseada")
	def void enfriarA5GradosLoDejaEn5Grados() {
		assertNotEquals(5, maquinaATemperaturaMayor.temperatura)
		enfriarHasta5.ejecutar(maquinaATemperaturaMayor)
		assertEquals(5, maquinaATemperaturaMayor.temperatura)
	}

	@Test
	@DisplayName("la operación da error si la máquina está a menor temperatura")
	def void enfriarA5CuandoLaMaquinaEstaMuyFriaTiraError() {
		assertThrows(BusinessException, [ enfriarHasta5.ejecutar(maquinaATemperaturaMenor) ])
	}
	
}