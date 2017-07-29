//
//  Repository.swift
//  WesterosApp
//
//  Created by Alan Casas on 11/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

//Creacion de Clase para comprobar creacion de casas.
final class Repository {
    
    static let local = LocalFactory()
    
}

//Creamos un protocolo para crear casas
protocol HouseFactory {

    typealias Filter = (House)->Bool

    var houses: [House] {get}
    func houseRequired(houseName:String) -> House?
    func houseFiltered(filteredBy: Filter) -> [House]

}

// Creamos una clase para que nos cree y nos devuelva un array de casas ordenado como lo hayamos hecho en el metodo comparable de House. 
final class LocalFactory: HouseFactory {
    func houseFiltered(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    var houses: [House]{
        get {
            //Aqui es donde creamos los emblemas
            let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let lannisterSigil = Sigil(description: "Rampant", image: #imageLiteral(resourceName: "lannister.jpg"))
            let targaryenSigil = Sigil(description: "Dragon", image: #imageLiteral(resourceName: "targaryen"))
            let baratheonSigil = Sigil(description: "Venado coronado, de sable sobre oro", image: #imageLiteral(resourceName: "baratheon"))
            
            //URLS
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let baratheonURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!

            //Creamos las casas
            let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming !!", wikiURL: starkURL)
            let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar", wikiURL: lannisterURL)
            let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", wikiURL: targaryenURL)
            let baratheonHouse = House(name: "Baratheon", sigil: baratheonSigil, words: "Nuestra es la Furia", wikiURL: baratheonURL)
            
            //Creamos los personajes
            let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
            let robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            let jaime = Person(name: "Jaime", alias: "El mata reyes", house: lannisterHouse)
            let tywin = Person(name: "Tywin", alias: "", house: lannisterHouse)
            let joffrey = Person(name: "Joffrey", house: lannisterHouse)

            let aegon = Person(name: "Aegon", alias: "Aegon el Dragón", house: targaryenHouse)
            let aemon = Person(name: "Aemon", alias: "El Caballero Dragon", house: targaryenHouse)
            let daenerys = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
            
            let orys = Person(name: "Orys", house: baratheonHouse)
            let robert = Person(name: "Robert", house: baratheonHouse)
            let stannis = Person(name: "Stannis", house: baratheonHouse)
            
            //Agregar los personajes a las casas
            starkHouse.addPerson(person: ned)
            starkHouse.addPerson(person: robb)
            starkHouse.addPerson(person: arya)

            lannisterHouse.addPerson(person: tyrion)
            lannisterHouse.addPerson(person: cersei)
            lannisterHouse.addPerson(person: jaime)
            lannisterHouse.addPerson(person: tywin)
            lannisterHouse.addPerson(person: joffrey)

            targaryenHouse.addPerson(person: aegon)
            targaryenHouse.addPerson(person: aemon)
            targaryenHouse.addPerson(person: daenerys)

            baratheonHouse.addPerson(person: orys)
            baratheonHouse.addPerson(person: robert)
            baratheonHouse.addPerson(person: stannis)
            
           
            return [starkHouse, lannisterHouse, targaryenHouse, baratheonHouse].sorted()
            
        }
    }
    
    func houseRequired (houseName: String) -> House?{

        let house = houses.filter { $0 .name.uppercased() == houseName.uppercased() }.first

        return house
    }
    
}

extension LocalFactory{
    var count: Int{
        return houses.count
    }
}










































