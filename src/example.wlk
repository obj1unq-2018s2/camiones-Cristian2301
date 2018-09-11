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
    }
    
    method pesoTotal(){
    	return tara + cargamento.sum({elemento => elemento.peso()})
    }

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
