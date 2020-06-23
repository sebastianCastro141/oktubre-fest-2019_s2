import marcas.*
import jarras.*
import carpas.*
class Personas {
	
	var property peso 
	var property jarrasCompradas = []
	var property escuchaMusicaTradicional 
	var property nivelDeAguante
	
	method estaEbria () =  jarrasCompradas.sum({j => j.capacidad()})*peso > nivelDeAguante
	method totalDeAlcohol () = jarrasCompradas.sum({j => j.contenidoDeAlcohol()})
	method quiereEntrarA(carpa) = escuchaMusicaTradicional == carpa.tieneBanda()  
	method puedeEntrar(carpa) = self.quiereEntrarA(carpa) and carpa.dejaEntrar(self)
	method entrarEnCarpa(carpa) 
	{
		if (self.puedeEntrar(carpa))
		{
			carpa.cantidadDeGente().add(self)
		}
		else 
		{
			throw"carpa llena o demasiado ebrio"
		}
	} 
	method esEbrioEmpedernido() = jarrasCompradas.any({j => j.capacidad() >= 1})
	
	
}

class Belga inherits Personas 
{
	
	method marcasQueLeGustan() 
		{ 
			const listaDeMarcas = jarrasCompradas.map ({m => m.marca()}) 
		
			return listaDeMarcas.filter({m => m.contenidoLupulo()>4})
	    }
	method leGustaEstaMarca (marca) = self.marcasQueLeGustan().contains(marca)
	override method quiereEntrarA(carpa) = super(carpa) and  self.leGustaEstaMarca (carpa.marcaQueVende())
	method esPatriota() = jarrasCompradas.any({j => j.marca().paisDeFabricacion() == "belgica"})
}

class Checo inherits Personas 
{
		method marcasQueLeGustan() 
		{ 
			const listaDeMarcas = jarrasCompradas.map ({m => m.marca()}) 
		
			return listaDeMarcas.filter({m => m.graduacion() > 8})
	    }
	    method leGustaEstaMarca (marca) = self.marcasQueLeGustan().contains(marca)
	    override method quiereEntrarA(carpa) = super(carpa) and  self.leGustaEstaMarca (carpa.marcaQueVende())
	    method esPatriota() = jarrasCompradas.any({j => j.marca().paisDeFabricacion() == "republica checa"})
}

class Alemanes inherits Personas 
{
		method marcasQueLeGustan()  = jarrasCompradas.map ({m => m.marca()}) 
	    method leGustaEstaMarca (marca) = self.marcasQueLeGustan().contains(marca)
	    override method quiereEntrarA(carpa) = super(carpa) and  self.leGustaEstaMarca (carpa.marcaQueVende()) and carpa.cantidadDeGente().even()
	    method esPatriota() = jarrasCompradas.any({j => j.marca().paisDeFabricacion() == "alemania"})
}
