object reglaMundial
{
	var property graduacionReglamentaria
	method deGraduacion() = graduacionReglamentaria
}

class Marcas {

	var property contenidoLupulo 
	var property paisDeFabricacion	
	var property graduacion
}

class CervezaRubia inherits Marcas
{
	
}

class CervezaNegra inherits Marcas 
{
	override method graduacion() = reglaMundial.deGraduacion().min(self.contenidoLupulo()*2)
}

class CervezaRoja inherits CervezaNegra 
{
	override method graduacion () = super()*1.25
}
