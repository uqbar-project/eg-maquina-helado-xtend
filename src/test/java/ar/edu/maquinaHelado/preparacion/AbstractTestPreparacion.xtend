package ar.edu.maquinaHelado.preparacion

import ar.edu.maquinaHelado.IceMachine2000
import ar.edu.maquinaHelado.MaquinaHelado
import ar.edu.maquinaHelado.ingredientes.Ingrediente
import org.junit.Before

class AbstractTestPreparacion {
	IceMachine2000 stubIceMachine
	protected MaquinaHelado maquina
	protected MaquinaHelado maquinaMuyFria
	protected Ingrediente leche
	protected Ingrediente azucar
	protected Ingrediente chocolate
	
	@Before
	def void init() {
		leche = new Ingrediente("leche", 125)
		azucar = new Ingrediente("azucar", 72)
		chocolate = new Ingrediente("chocolate", 84)
		
		stubIceMachine = new StubIceMachine(15)
		
		maquina = new MaquinaHelado(stubIceMachine) => [
			ingresarIngrediente(azucar, 1000)
			ingresarIngrediente(leche, 7500)
			ingresarIngrediente(chocolate, 500)
		]
		maquinaMuyFria = new MaquinaHelado(new StubIceMachine(-2)) => [
			ingresarIngrediente(new Ingrediente("leche", 125), 2500)
		]
	}
	
}