import cosas.*

object camion {
	const property cosas = #{}
	
	//cargar
	//No se puede cargar algo ya cargado 
	method cargar(unaCosa) {
		if(! estaCargado(unaCosa)){
			cosas.add(unaCosa)
		}
		//error
	}

	//descargar
	//ni descargar lo que no contiene el
	method descargar(unaCosa) {
		if(estaCargado(unaCosa)){
			cosas.remove(unaCosa)
		}
		//error
	}

	method estaCargado(unaCosa){  
		cosas.any({
			cosa => cosa == unaCosa
		})
	}

	//el peso de cada uno de los objetos cargados es un número par.

	//alguna cosa que pesa exactamente una cantidad de kilogramos dada.

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

