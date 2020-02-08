package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.creacionales.PreparacionBuilder
import ar.edu.maquinaHelado.exceptions.BusinessException
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Cuando se intenta preparar un helado sin ingredientes")
class TestSinIngredientes {
	
	@Test
	@DisplayName("la operación resulta en error")
	def void testOperacionDaError() {
		assertThrows(BusinessException, [ new PreparacionBuilder().build ])
	}

}