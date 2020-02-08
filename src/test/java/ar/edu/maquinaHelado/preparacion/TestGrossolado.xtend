package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.creacionales.PreparacionBuilder
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Dada una preparación para una máquina")
class TestGrossolado {
	
	Ingrediente chocolate
	MaquinaHelado maquina
	Preparacion grossolado
	
	@BeforeEach
	def void initPreparacion() {
		val stubIceMachine = new StubIceMachine(15)

		val leche = new Ingrediente("leche", 125)
		val azucar = new Ingrediente("azucar", 72)
		chocolate = new Ingrediente("chocolate", 84)

		maquina = new MaquinaHelado(stubIceMachine) => [
			ingresarIngrediente(azucar, 1000)
			ingresarIngrediente(leche, 7500)
			ingresarIngrediente(chocolate, 500)
		]
		
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
	@DisplayName("se descuenta el stock de un ingrediente que está en la máquina según la preparación")
	def void testDescuentaStockOk() {
		val cuantoChocolate = maquina.stock(chocolate)
		maquina.preparar(grossolado)
		assertEquals(cuantoChocolate - 30, maquina.stock(chocolate))
	}

	@Test
	@DisplayName("la máquina queda con la temperatura según la preparación")
	def void testMaquinaATemperaturaOk() {
		maquina.preparar(grossolado)
		assertEquals(0, maquina.temperatura)
	}

	@Test
	@DisplayName("la máquina no queda en error")
	def void testEstadoMaquinaOk() {
		maquina.preparar(grossolado)
		assertFalse(maquina.estaEnError)
	}

	@Test
	@DisplayName("la máquina queda libre para hacer otra preparación")
	def void testPreparacionOk() {
		maquina.preparar(grossolado)
		assertTrue(maquina.estaLibre)
	}

}