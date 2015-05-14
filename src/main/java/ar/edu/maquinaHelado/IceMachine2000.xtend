package ar.edu.maquinaHelado

interface IceMachine2000 {
	def void action(int actionCode)
	def void add(int ingredientCode, int amount)
	def int getStatus()
	def int getValue(int code)
	def void setValue(int code, int value) 
}