import wollok.mirror.*
import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method validarDescarga(unaCosa) {
	  if(! self.estaCargado(unaCosa)){
		self.error("no existe eso en las cosas cargasod")
	  }
	}

	method validarCarga(unaCosa) {
		if(self.estaCargado(unaCosa)){
			self.error("ya esta cargado")
		}
	}

	method estaCargado(unaCosa){  
		return cosas.any({
			cosa => cosa == unaCosa
		})
	}

	method todoPesoPar(){
		return cosas.all({
			cosa => self.esDePesoPar(cosa)
		})
	}

	method esDePesoPar(cosa) = cosa.peso().even()

	method pesaExactamente (cantidad) {
 		return cosas.any( { 
			cosa => self.esDelMismoPeso(cosa.peso(), cantidad)
	 	} )
	}

	method esDelMismoPeso(peso1, peso2) = peso1 == peso2

	method pesoDelCamion() = self.taraDelCamion() + self.cargaDelCamion()

	method taraDelCamion() = 1000

	method cargaDelCamion() = cosas.sum({ cosa => cosa.peso() })

	method estaExedidoDePeso() = self.pesoDelCamion() > self.pesoAceptableDeCamion()

	method pesoAceptableDeCamion() = 2500

	method encontrarCosaConPeligrosidad(valor) {
		return cosas.find( {
			cosa => cosa.nivelDePeligrosidad() == valor
		})
	}

	method cosasQueSuperePeligrosidad(nivelDePeligrosidad) {
	  return cosas.filter( {
		cosa => cosa.nivelDePeligrosidad() > nivelDePeligrosidad
		})
	}

	method cosasConMasNivelQue(cosa){
		return self.cosasQueSuperePeligrosidad(cosa.nivelDePeligrosidad())
	}
	
	//method puedeCircularEnRuta() = self.estaExedidoDePeso() && 
}
	//si no está excedido de peso y, además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.


//con las clases tengo que crear = Instancia, referencia y quien accede (obj ya lo hace)
//objeto sin referencia muere

