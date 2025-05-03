object neo{
    var energia = 100    

    method esElElegido(){
        return true
    }

    method vitalidad() {
        return energia / 10      
    }

    method saltar() {
        energia = energia / 2      
    }
}

object morfeo{
    var estaDescansado = false
    var vitalidad = 8

    method esElElegido() {
        return false      
    }

    method vitalidad(){
        return vitalidad
    }

    method cambiarEstado(){
        if (estaDescansado){
            estaDescansado = false
        }
        else{
            estaDescansado = true
        }
    }

    method cambiarVitalidad(vit){
        vitalidad = vit        
    }

    method saltar(){
        vitalidad = vitalidad - 1
        self.cambiarEstado()
    }
}

object trinity{

    method vitalidad(){
        return 0
    }

    method saltar(){

    }

    method esElElegido(){
        return false
    }

}

object nave{
    var pasajeros = #{neo,morfeo,trinity}

    method cantidadPasajeros(){
        return pasajeros.size()
    }

    method pasajeroDeMayorVitalidad(){
        return pasajeros.max({p => p.vitalidad()})
    }

    method pasajeroDeMenorVitalidad(){
        return pasajeros.min({p => p.vitalidad()})
    }

    method vitalidadEquilibrada(){
        return self.pasajeroDeMayorVitalidad().vitalidad()
         < self.pasajeroDeMenorVitalidad().vitalidad() * 2         
    }

    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
    }
}