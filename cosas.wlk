object knightRider {

  method peso() = 500

	method nivelDePeligrosidad() = 10 

  method bulto() = 1 

  method accidentar(){}
}

object arenaAGranel {
    var property peso = 0

    method nivelDePeligrosidad() = 1

    method bulto() = 1   

    method accidentar(){peso += 20}
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

  method bulto() = 2

	method accidentar() {
	  if (transformacion == "auto"){
      "robot"
	  } else {
		 "auto"
	  }
	}
}

object paqueteDeLadrillos {
    var property cantDeLadrillos = 0

    method peso() = cantDeLadrillos * 2 
    method nivelDePeligrosidad() = 2

    method bulto(){
		  if (self.cantDeLadrillosMenorIgualA(100)) {
        return 1 
      } else if (self.cantDeLadrillosMayorIgualA(101) && self.cantDeLadrillosMenorIgualA(300)){ 
        return 2 
      } else { 
        return 3 }
	}

  method cantDeLadrillosMayorIgualA(cantidad) = cantDeLadrillos >= cantidad
  method cantDeLadrillosMenorIgualA(cantidad) = cantDeLadrillos <= cantidad

	method accidentar(){
    cantDeLadrillos = (cantDeLadrillos - 12).max(0)}
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

    method bulto(){
      if (estaConMisiles){
        return 2
      } else {
        return 1
      }
    }
	
    method accidentar(){
      estaConMisiles = true
    }
}

object residuosRadiactivos {
    var property peso = 0

    method nivelDePeligrosidad() = 200 

    method bulto() = 1

	  method accidentar(){
      peso += 15
    }
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

  method bulto() = cosas.sum({cosa => cosa.bulto()}) + 1
	
  method accidentar(){
    cosas.forEach({cosa => cosa.accidentar()})}
}

object embalajeDeSeguridad {
  var property coberturaA = null

  method peso() = coberturaA.peso()

  method nivelDePeligrosidad() = coberturaA.nivelDePeligrosidad() / 2

  method bulto() = 2

	method accidentar(){
    coberturaA.accidentar()
  }
}