import marcas.*
class Jarra 
{
	var property capacidad
	var property marca
	
	method contenidoDeAlcohol() = (marca.graduacion()/100) * capacidad
}