import personas.*
import jarras.*
import marcas.*
class Carpas 
{
	var property limiteDeGente
	var property tieneBanda
	var property marcaQueVende
	var property cantidadDeGente = []
	
	method dejaEntrar(persona)= cantidadDeGente.size() < limiteDeGente and not persona.estaEbria()
	method servirJarraA(capacidadDeLaJarra, persona) 
	{
		if (not cantidadDeGente.isEmpty())
		{
			persona.jarrasCompradas().add(new Jarra(capacidad = capacidadDeLaJarra, marca = marcaQueVende) )
		}
		else 
		{
			throw "no hay nadie"
		}
	} 
	method cantidadDeEbriosEmperdernidos()= cantidadDeGente.count({g => g.esEbrioEmpedernido()})
	
	
}