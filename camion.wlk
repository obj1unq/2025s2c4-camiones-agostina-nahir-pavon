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

	/*
	method encontrarCosaSegun(condicion) {
		return cosas.find ({
			cosa => condicion.applyTo(cosa.nivelDePeligrosidad())
		})
	}

	method encontrarCosaConPeligrosidad(valor) {
		return self.encontrarCosaSegun({ nivelDePeligrosidad == valor })
	}

	method cosaQueSuperePeligrosidad(nivelASuperar) {
		return self.encontrarCosaSegun({ nivelDePeligrosidad > nivelASuperar })
	}
	*/

	//Cosas cargadas que estén en el camión que sean más peligrosas que otra cosa indicada.

	method puedeCircularEnRuta() = 
		self.estaExedidoDePeso() && 
	//si no está excedido de peso y, además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.
}

//con las clases tengo que crear = Instancia, referencia y quien accede (obj ya lo hace)
//objeto sin referencia muere