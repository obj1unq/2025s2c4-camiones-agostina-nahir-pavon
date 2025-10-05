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

	method puedeCircularEnLaRuta(nivelDePeligrosidad) = !self.estaExedidoDePeso() && self.ningunSuperaLaPeligrosidad(nivelDePeligrosidad)

	method ningunSuperaLaPeligrosidad(nivelDePeligrosidad) = self.cosasQueSuperePeligrosidad(nivelDePeligrosidad).size() == 0

	method cosasConMasNivelQue(cosa){
		return self.cosasQueSuperePeligrosidad(cosa.nivelDePeligrosidad())
	}
	
	method tieneAlgoEntre(min, max) {
		return cosas.any( {
			cosa => cosa.peso() > min && cosa.peso() < max
		})
	}

	method cosaMasPesada() {
		return cosas.max( {
			cosa => cosa.peso()
		})
	}

	method pesoDelasCosas() {
		return cosas.foreach( {
			cosa => cosa.peso()
		})
	}
}


//con las clases tengo que crear = Instancia, referencia y quien accede (obj ya lo hace)
//objeto sin referencia muere

