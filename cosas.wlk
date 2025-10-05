object knightRider {

  method peso() = 500

	method nivelDePeligrosidad() = 10 
}

object arenaAGranel {
    var property peso = 0

    method nivelDePeligrosidad() = 1  
}

object bumblebee {
  var property transformacion = "auto"

  method peso() = 800

  method esAutoORobot() = transformacion

  method nivelDePeligrosidad() {
    if (self.esAutoORobot() == "auto"){
        return 15
    } else {
        return 30
    }
  }
}

object paqueteDeLadrillos {
    var property cantDeLadrillos = 0

    method peso() = cantDeLadrillos * 2 
    method nivelDePeligrosidad() = 2
}

object bateriaAntiaerea {
    var property estaConMisiles = true

    //se repite codigo
    method peso() {
      if (self.estaConMisiles()){
        return 300
      } else { 
        return 200
      }
    } 

    method nivelDePeligrosidad() {
      if (estaConMisiles){
        return 100
      } else { 
        return 0
      }
    } 
}

object residuosRadiactivos {
    var property peso = 0

    method nivelDePeligrosidad() = 200 
}

object contenedorPortuario {
  const cosas = #{}

  method cargar(unaCosa){
		cosas.add(unaCosa)
	}

  method peso() = self.pesoDeContendorPortuario() + self.sumasDeLasCosas()

  method pesoDeContendorPortuario() = 100

  method sumasDeLasCosas() = cosas.sum({ cosa => cosa.peso() }) 

  method nivelDePeligrosidad() {
	  if (!cosas.isEmpty()) {
      return self.cosaConMasNivelDePeligrosidad().nivelDePeligrosidad()
    }
     else {
      return 0
     }
	}

  method cosaConMasNivelDePeligrosidad() {
	  return cosas.max({cosa => cosa.nivelDePeligrosidad()})
	}
}

object embalajeDeSeguridad {
  var property coberturaA = null

  method peso() = coberturaA.peso()

  method nivelDePeligrosidad() = coberturaA.nivelDePeligrosidad() / 2
}