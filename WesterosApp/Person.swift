//
//  Person.swift
//  WesterosApp
//
//  Created by Alan Casas on 8/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation


final class Person{
    
    let name    :String
    let house   :House
    
    // Hacemos la propiedad opcional debido a que no todos los personajes tendran dicha propiedad
    private let _alias   :String?

    /*
//    Creamos una propiedad computada de _alias para poder ponerle un getter si no tiene un alias dejarle una cadena vacia y si tiene un alias ponerle dicho alias.
    var alias: String{
        
        get{
            /*
            if let theAlias = _alias{
                return theAlias
            }else{
                return ""
            }
             El codigo de arriba es exactamente el mismo que el de abajo, el de abajo es un ternario.
            */
            return _alias ?? ""
            
        }
        
    }
     
     toda la parte de arriba la podemos resumir en codigo de esta manera
 */
    
    // Revuelve un alias si lo tiene y si no una cadena vacia.
    var alias:String{
        return _alias ?? ""
    }
    
    //Creamos un inicializador, que lo hace en una lina mediante una tupla.
    init(name:String, alias: String?, house: House) {
        (self.name, self._alias, self.house) = (name, alias, house)
    }
    
    //Creamos un inicializador de conveniencia
    convenience init(name:String, house:House) {
        self.init(name: name, alias: nil, house: house)
    }
    
}

// Extension para devolver el nombre completo.
extension Person{
    
    var fullName: String {
        return "\(name) \(house.name)"
    }
    
}

//Extension para comparar. 
extension Person{
    var proxy :String{
    
        return "\(name) \(house.name)"
        
    }
}

extension Person: Hashable{
    var hashValue: Int {
        
        get{
            return proxy.hashValue
        }
        
    }
}

extension Person: Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }

}


extension Person : Comparable{
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
}



























