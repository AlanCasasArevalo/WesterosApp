//
//  House.swift
//  WesterosApp
//
//  Created by Alan Casas on 7/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

//Creamos unos typealias para que pasen los tests
typealias Words = String
typealias Members = Set<Person>


//MARK: - ClassesTests
//Creamos las Clases haciendolas que sean finales (que no se herede de ellas) si tienes que hacer que alguna clase herede de ella le quitas el final.
final class House {
    
//    Creamos unas propiedades que seran las que tenga el objeto casa.
    let name    :String
    let sigil   :Sigil
    let words   :Words
    let wikiURL :URL
    
//    Creamos una propiedad que sera privada para no ser mostrada a nadie.
    private var _member: Members
    
//    Creamos el inicializador de la clase
    init(name:String,
         sigil:Sigil,
         words:Words,
         wikiURL: URL) {
        
//        Usamos una tupla para poder inicializar los valore del inicializador. Es como hacer self.name = name
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, wikiURL)
        
//        Inicializamos la propiedad _member
        _member = Members()
        
    }
    
}

//MARK: - Extensions

//Creamos extensiones para hacer mas versatil la clase creada, agregandole metodos a la clase.

// Extension para comparar casas
extension House {
    var proxyForEquality:String {
        return "\(name) \(words) \(houseCount)"
    }
    
    var proxyForComparison:String{
        return name.uppercased()
    }
}

extension House{
    
    func sortedMembers() -> [Person] {
        let memberArray:[Person] = Array(_member)
        
        return memberArray.sorted()
    }
    
}

//Extension para que devuelva el numero de miembros de la clase
extension House{
    var houseCount : Int{
        return _member.count
    }
}

//Extension para agregar nuevos miembros
extension House{
    
    func addPerson (person:Person){
        guard person.house.name == self.name else {
            return
        }
        
        _member.insert(person)
    }
    
    func addPeople(persons:Person...) {
        for person in persons {
            addPerson(person: person)
        }
    }
}


extension House {
    func personReturned(name: String) -> Person? {
        
        var nameRequierd:Person?
     
        for member in _member {
            if member.name == name{
                nameRequierd = member
            }
        }
        // Devolver personaje si esta
        return nameRequierd
    }
}

//Extension para implementar un numero Hash
extension House:Hashable{
    
    var hashValue : Int{
        return proxyForEquality.hashValue
    }
    
}

// Extension que compara igualdad 2 parametros, el de la izquierda y el de la derecha
extension House: Equatable{
    
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

//Extension que compara si es menor el de la izquierda y el de la derecha
extension House: Comparable{

    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }

}



//Clase que crea el emblema. 
final class Sigil{
    
    let description :String
    let image       : UIImage
    
    init(description: String, image:UIImage) {
        self.description = description
        self.image = image
    }
    
}























