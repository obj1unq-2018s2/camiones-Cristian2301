object camion {
	var cargamento = []
	const tara = 1000
	
	method cargar(cosa) {
		cargamento.add(cosa)
	}
	
	method descargar(cosa){
		cargamento.remove(cosa)
	}

    method objetosPeligrosos(n){
    	return cargamento.filter({elemento => elemento.nivelPeligrosidad() > n})
    }
    
    method objetosMasPeligrososQue(cosa){
    	return cargamento.filter({elemento => elemento.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
    }
    
    method puedeCircularEnRuta(nivelMaximoDePeligrosidad){
    	return cargamento.all({elemento => elemento.nivelDePeligrosdad() <= nivelMaximoDePeligrosidad})
    	// return not cargamento.any({elemento => elemento.nivelDePeligrosidad > nivelMaximoDePeligrosidad})
    }
    
    method pesoTotal(){
    	return tara + cargamento.sum({elemento => elemento.peso()})
    }
    
//    method pesoTotal2(){
//    	return tara + cargamento.map({elemento => elemento.peso()}).sum()
//    }

    method excedidoDePeso(){
    	return self.pesoTotal() > 2500
    }
}


object knightRider{
	
	method peso(){
		return 500
	}
	
	method nivelPeligrosidad(){
		return 10
	}
}

object bumpleBee{
	var property transformadoEnAuto = false
	
	method peso() = 800
	
	method nivelPeligrosidad(){
		if(transformadoEnAuto){
			return 15
		}
		else{
			return 30
		}
	}
}

object deposito{
	var cosas = [knightRider, bumpleBee]
	
	method cargarCamion(camion){
		cosas.forEach({cosa => camion.cargar(cosa)})
	}
	
}

object paqueteDeLadrillos{
	var property cantidadDeLadrillos = 0
	
	method peso(){
		return 2 * cantidadDeLadrillos
	}
	
	method nivelDePeligrosidad(){
		return 2
	}
	
}

object arenaAGranel{
	var property peso = 0
	
	method nivelDePeligrosidad(){
		return 1
	}
}

object bateriaAntiaerea{
	var property estaConMisiles = false
	
	method peso(){
		if(estaConMisiles){
			return 300
		}
		else{
			return 200
		}
	}
	
	method nivelDePeligrosidad(){
		if(estaConMisiles){
			return 100
		}
		else{
			return 0
		}
	}
	
}

object contenedorPortuario{
	const cosasQueTiene = []
	
	method agregarCosa(cosa){
		cosasQueTiene.add(cosa)
	}
	method peso(){
		return 100 + cosasQueTiene.sum({elemento => elemento.peso()})
	}
	
	method nivelDePeligrosidad(){
		if(not cosasQueTiene.isEmpty()){
			return cosasQueTiene.max({elemento => elemento.nivelDePeligrosidad()}).nivelDePeligrosidad()
		}
		else{
			return 0
		}
	}
	
}


object residuosRadioactivos{
	var property peso = 0
	
	method nivelDePeligrosidad()= 200
}


object embalajeDeSeguridad{
	var property cosa = null
	
	method peso(){
		return cosa.peso()
	}
	
	method nivelDePeligrosidad(){
		return cosa.nivelDePeligrosidad() / 2
	}
}
