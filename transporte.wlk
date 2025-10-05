import camion.*
import cosas.*

object almacen {
    const property cosas = #{}

    method  pasarAlAlmacén(carga){
        cosas.addAll(carga)
    }
}

object rutaNueve {

    method soportaViaje(vehiculo){
        return vehiculo.puedeCircularEnRuta(20)
    }
}

object caminosVecinales {
    var property pesoMaximoPermitido = 0

    method soportaViaje(vehiculo){
        return vehiculo.pesoTotal() <= pesoMaximoPermitido
    }
}