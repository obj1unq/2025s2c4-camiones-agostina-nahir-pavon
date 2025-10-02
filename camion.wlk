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

	method pesoPar() {
		return cosas.all({
			cosa => self.esDePesoPar(cosa)
		})
	}

	method esDePesoPar(cosa) = cosa.peso() //como saco el mod en wollok?

	//alguna cosa que pesa exactamente una cantidad de kilogramos dada.
	method pesaExactamente(unPeso) = 

	//Peso 
	//la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos.
	
	//exceso de peso
	//el peso total es superior al peso máximo aceptable, que es de 2500 kilos.

	//El de nivel
	//Encontrar una cosa cargada cuyo nivel de peligrosidad coincida exactamente con el valor indicado.

	//Cosas cargadas que estén en el camión que superen cierto nivel de peligrosidad.

	//Cosas cargadas que estén en el camión que sean más peligrosas que otra cosa indicada.

	//Puede circular en ruta
	//si no está excedido de peso y, además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.
}

