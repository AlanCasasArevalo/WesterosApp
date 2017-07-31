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

protocol SeasonFactory {
    
    typealias Filter = (Season)->Bool
    
    var seasons: [Season] {get}
    func seasonRequired(seasonName:String) -> House?
    func seasonFiltered(filteredBy: Filter) -> [Episode]
    
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
    
    var seasons: [Season] {
        //Creamos fechas de salida de temporadas
        let dateComponentReleaseSeason1 = DateComponents(calendar: .current, year: 2011, month: 04, day: 11)
        let releaseSeason1 = dateComponentReleaseSeason1.date!
        
        let dateComponentReleaseSeason2 = DateComponents(calendar: .current, year: 2012, month: 04, day: 01)
        let releaseSeason2 = dateComponentReleaseSeason2.date!
        
        let dateComponentReleaseSeason3 = DateComponents(calendar: .current, year: 2013, month: 03, day: 31)
        let releaseSeason3 = dateComponentReleaseSeason3.date!

        let dateComponentReleaseSeason4 = DateComponents(calendar: .current, year: 2014, month: 04, day: 06)
        let releaseSeason4 = dateComponentReleaseSeason4.date!

        let dateComponentReleaseSeason5 = DateComponents(calendar: .current, year: 2015, month: 04, day: 12)
        let releaseSeason5 = dateComponentReleaseSeason5.date!
        
        let dateComponentReleaseSeason6 = DateComponents(calendar: .current, year: 2016, month: 04, day: 24)
        let releaseSeason6 = dateComponentReleaseSeason6.date!
        
        let dateComponentReleaseSeason7 = DateComponents(calendar: .current, year: 2017, month: 07, day: 16)
        let releaseSeason7 = dateComponentReleaseSeason7.date!
        
        //Creamos las temporadas
        let season1 = Season(seasonName: "Temporada 1", realeaseDate: releaseSeason1)
        let season2 = Season(seasonName: "Temporada 2", realeaseDate: releaseSeason2)
        let season3 = Season(seasonName: "Temporada 3", realeaseDate: releaseSeason3)
        let season4 = Season(seasonName: "Temporada 4", realeaseDate: releaseSeason4)
        let season5 = Season(seasonName: "Temporada 5", realeaseDate: releaseSeason5)
        let season6 = Season(seasonName: "Temporada 6", realeaseDate: releaseSeason6)
        let season7 = Season(seasonName: "Temporada 7", realeaseDate: releaseSeason7)
        
        //Creamos los episodios que tendran las temporadas
        //Temporada 1
        let episode1Season1 = Episode(title: "Se acerca el invierno", realeaseDate: releaseSeason1, season: season1)
        let episode2Season1 = Episode(title: "El camino real", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode3Season1 = Episode(title: "Lord Nieve", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode4Season1 = Episode(title: "Tullidos, bastardos y cosas rotas", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode5Season1 = Episode(title: "El lobo y el león", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode6Season1 = Episode(title: "Una corona de oro", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode7Season1 = Episode(title: "Ganas o mueres", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode8Season1 = Episode(title: "Por el lado de la punta", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode9Season1 = Episode(title: "Baelor", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        let episode10Season1 = Episode(title: "Fuego y sangre", realeaseDate: releaseSeason1.addDay(dayToAdd: 7), season: season1)
        
        //Temporada 2
        let episode1Season2 = Episode(title: "El norte no olvida", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode2Season2 = Episode(title: "Las tierras de la noche", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode3Season2 = Episode(title: "Lo que está muerto no puede morir", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode4Season2 = Episode(title: "Jardín de huesos", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode5Season2 = Episode(title: "El fantasma de Harrenhal", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode6Season2 = Episode(title: "Los dioses antiguos y nuevos", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode7Season2 = Episode(title: "Un hombre sin honor", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode8Season2 = Episode(title: "Un príncipe de Invernalia", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode9Season2 = Episode(title: "Aguasnegras", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        let episode10Season2 = Episode(title: "Valar Morghulis", realeaseDate: releaseSeason2.addDay(dayToAdd: 7), season: season2)
        
        //Temporada 3
        let episode1Season3 = Episode(title: "Valar Dohaeris", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode2Season3 = Episode(title: "Alas negras, palabras negras", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode3Season3 = Episode(title: "Camino del castigo", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode4Season3 = Episode(title: "Y ahora su guardia ha terminado", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode5Season3 = Episode(title: "Besado por el fuego", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode6Season3 = Episode(title: "El ascenso", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode7Season3 = Episode(title: "El oso y la doncella", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode8Season3 = Episode(title: "Los Segundos Hijos", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode9Season3 = Episode(title: "Las lluvias de Castamere", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        let episode10Season3 = Episode(title: "Mhysa", realeaseDate: releaseSeason3.addDay(dayToAdd: 7), season: season3)
        
        //Temporada 4
        let episode1Season4 = Episode(title: "Dos espadas", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode2Season4 = Episode(title: "El león y la rosapadas", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode3Season4 = Episode(title: "Rompedora de cadenas", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode4Season4 = Episode(title: "Guardajuramentos", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode5Season4 = Episode(title: "Primero de su nombre", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode6Season4 = Episode(title: "Leyes de Dioses y hombres", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode7Season4 = Episode(title: "El sinsonte", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode8Season4 = Episode(title: "La montaña y la víbora", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode9Season4 = Episode(title: "Los guardianes en el muro", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        let episode10Season4 = Episode(title: "Los niños", realeaseDate: releaseSeason4.addDay(dayToAdd: 7), season: season4)
        
        //Temporada 5
        let episode1Season5 = Episode(title: "The Wars to Come", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode2Season5 = Episode(title: "The House of Black and White", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode3Season5 = Episode(title: "High Sparrow", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode4Season5 = Episode(title: "The Sons Of The Harpy", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode5Season5 = Episode(title: " Kill The Boy", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode6Season5 = Episode(title: "Unbowed, Unbent, Unbroken", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode7Season5 = Episode(title: "The Gift", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode8Season5 = Episode(title: "Hardhome", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode9Season5 = Episode(title: "The Dance of Dragons", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        let episode10Season5 = Episode(title: "Mother’s Mercy", realeaseDate: releaseSeason5.addDay(dayToAdd: 7), season: season5)
        
        //Temporada 6
        let episode1Season6 = Episode(title: "The Red Woman", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode2Season6 = Episode(title: "Home", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode3Season6 = Episode(title: "Oathbreaker", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode4Season6 = Episode(title: "Book of the Stranger", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode5Season6 = Episode(title: " The Door", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode6Season6 = Episode(title: "Blood of My Blood", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode7Season6 = Episode(title: "The Broken Man", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode8Season6 = Episode(title: "No One", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode9Season6 = Episode(title: "Battle of Bastards", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        let episode10Season6 = Episode(title: "The Winds of Winter", realeaseDate: releaseSeason6.addDay(dayToAdd: 7), season: season6)
        
        //Temporada 7
        let episode1Season7 = Episode(title: "Dragonstone", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode2Season7 = Episode(title: "Stormborn", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode3Season7 = Episode(title: "The Queen's Justice", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode4Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode5Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode6Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode7Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode8Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode9Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        let episode10Season7 = Episode(title: "Episode", realeaseDate: releaseSeason7.addDay(dayToAdd: 7), season: season7)
        
        //Agregar los episodios a las temporadas
        season1.addEpisode(newEpisode: episode1Season1)
        season1.addEpisode(newEpisode: episode2Season1)
        season1.addEpisode(newEpisode: episode3Season1)
        season1.addEpisode(newEpisode: episode4Season1)
        season1.addEpisode(newEpisode: episode5Season1)
        season1.addEpisode(newEpisode: episode6Season1)
        season1.addEpisode(newEpisode: episode7Season1)
        season1.addEpisode(newEpisode: episode8Season1)
        season1.addEpisode(newEpisode: episode9Season1)
        season1.addEpisode(newEpisode: episode10Season1)

        season2.addEpisode(newEpisode: episode1Season2)
        season2.addEpisode(newEpisode: episode2Season2)
        season2.addEpisode(newEpisode: episode3Season2)
        season2.addEpisode(newEpisode: episode4Season2)
        season2.addEpisode(newEpisode: episode5Season2)
        season2.addEpisode(newEpisode: episode6Season2)
        season2.addEpisode(newEpisode: episode7Season2)
        season2.addEpisode(newEpisode: episode8Season2)
        season2.addEpisode(newEpisode: episode9Season2)
        season2.addEpisode(newEpisode: episode10Season2)

        season3.addEpisode(newEpisode: episode1Season3)
        season3.addEpisode(newEpisode: episode2Season3)
        season3.addEpisode(newEpisode: episode3Season3)
        season3.addEpisode(newEpisode: episode4Season3)
        season3.addEpisode(newEpisode: episode5Season3)
        season3.addEpisode(newEpisode: episode6Season3)
        season3.addEpisode(newEpisode: episode7Season3)
        season3.addEpisode(newEpisode: episode8Season3)
        season3.addEpisode(newEpisode: episode9Season3)
        season3.addEpisode(newEpisode: episode10Season3)
        
        season4.addEpisode(newEpisode: episode1Season4)
        season4.addEpisode(newEpisode: episode2Season4)
        season4.addEpisode(newEpisode: episode3Season4)
        season4.addEpisode(newEpisode: episode4Season4)
        season4.addEpisode(newEpisode: episode5Season4)
        season4.addEpisode(newEpisode: episode6Season4)
        season4.addEpisode(newEpisode: episode7Season4)
        season4.addEpisode(newEpisode: episode8Season4)
        season4.addEpisode(newEpisode: episode9Season4)
        season4.addEpisode(newEpisode: episode10Season4)
        
        season5.addEpisode(newEpisode: episode1Season5)
        season5.addEpisode(newEpisode: episode2Season5)
        season5.addEpisode(newEpisode: episode3Season5)
        season5.addEpisode(newEpisode: episode4Season5)
        season5.addEpisode(newEpisode: episode5Season5)
        season5.addEpisode(newEpisode: episode6Season5)
        season5.addEpisode(newEpisode: episode7Season5)
        season5.addEpisode(newEpisode: episode8Season5)
        season5.addEpisode(newEpisode: episode9Season5)
        season5.addEpisode(newEpisode: episode10Season5)
        
        season6.addEpisode(newEpisode: episode1Season6)
        season6.addEpisode(newEpisode: episode2Season6)
        season6.addEpisode(newEpisode: episode3Season6)
        season6.addEpisode(newEpisode: episode4Season6)
        season6.addEpisode(newEpisode: episode5Season6)
        season6.addEpisode(newEpisode: episode6Season6)
        season6.addEpisode(newEpisode: episode7Season6)
        season6.addEpisode(newEpisode: episode8Season6)
        season6.addEpisode(newEpisode: episode9Season6)
        season6.addEpisode(newEpisode: episode10Season6)
        
        season7.addEpisode(newEpisode: episode1Season7)
        season7.addEpisode(newEpisode: episode2Season7)
        season7.addEpisode(newEpisode: episode3Season7)
        season7.addEpisode(newEpisode: episode4Season7)
        season7.addEpisode(newEpisode: episode5Season7)
        season7.addEpisode(newEpisode: episode6Season7)
        season7.addEpisode(newEpisode: episode7Season7)
        season7.addEpisode(newEpisode: episode8Season7)
        season7.addEpisode(newEpisode: episode9Season7)
        season7.addEpisode(newEpisode: episode10Season7)
        
        //Devolver temporadas ordenadas .sorted()
        return  [season1, season2, season3, season4, season5, season6, season7]
    }
    
}

extension LocalFactory{
    var houseCount: Int{
        return houses.count
    }
}

extension LocalFactory {
    var seasonCount: Int {
        return seasons.count
    }
}

extension Date{
    func addDay (dayToAdd: Int) -> Date {
        
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: dayToAdd, to: self)!
        
    }
}








































