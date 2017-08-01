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

    typealias FilterHouse = (House)->Bool

    var houses: [House] {get}
    func houseRequired(houseName:String) -> House?
    func houseFiltered(filteredBy: FilterHouse) -> [House]

}

protocol SeasonFactory {
    
    typealias FilterSeason = (Season)->Bool
    
    var seasons: [Season] {get}
    func seasonRequired(seasonName:String) -> Season?
    func seasonFiltered(filteredBy: FilterSeason) -> [Season]
    
}


// Creamos una clase para que nos cree y nos devuelva un array de casas ordenado como lo hayamos hecho en el metodo comparable de House. 
final class LocalFactory: HouseFactory, SeasonFactory {
    
    func houseFiltered(filteredBy: (House) -> Bool) -> [House] {
        let houseFilter = Repository.local.houses.filter(filteredBy)
        return houseFilter
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
    

    func seasonFiltered(filteredBy: (Season) -> Bool) -> [Season] {
        let seasonFilter = Repository.local.seasons.filter(filteredBy)
        return seasonFilter
    }
    
    var seasons: [Season] {

        //Creamos fechas de salida de temporadas
        let dateComponentReleaseSeason1 = DateComponents(calendar: .current, year: 2011, month: 04, day: 11).date!
        let releaseSeason1:Date = dateComponentReleaseSeason1
        
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
        let episode2Season1 = Episode(title: "El camino real", realeaseDate: episode1Season1.releaseDate.releaseDate(sinceDate: episode1Season1.releaseDate) , season: season1)
        let episode3Season1 = Episode(title: "Lord Nieve", realeaseDate: episode2Season1.releaseDate.releaseDate(sinceDate: episode2Season1.releaseDate), season: season1)
        let episode4Season1 = Episode(title: "Tullidos, bastardos y cosas rotas", realeaseDate:episode3Season1.releaseDate.releaseDate(sinceDate: episode3Season1.releaseDate) , season: season1)
        let episode5Season1 = Episode(title: "El lobo y el león", realeaseDate: episode4Season1.releaseDate.releaseDate(sinceDate: episode4Season1.releaseDate) , season: season1)
        let episode6Season1 = Episode(title: "Una corona de oro", realeaseDate: episode5Season1.releaseDate.releaseDate(sinceDate: episode5Season1.releaseDate) , season: season1)
        let episode7Season1 = Episode(title: "Ganas o mueres", realeaseDate: episode6Season1.releaseDate.releaseDate(sinceDate: episode6Season1.releaseDate), season: season1)
        let episode8Season1 = Episode(title: "Por el lado de la punta", realeaseDate: episode7Season1.releaseDate.releaseDate(sinceDate: episode7Season1.releaseDate), season: season1)
        let episode9Season1 = Episode(title: "Baelor", realeaseDate: episode8Season1.releaseDate.releaseDate(sinceDate: episode8Season1.releaseDate) , season: season1)
        let episode10Season1 = Episode(title: "Fuego y sangre", realeaseDate: episode9Season1.releaseDate.releaseDate(sinceDate: episode9Season1.releaseDate) , season: season1)
        
        //Temporada 2
        let episode1Season2 = Episode(title: "El norte no olvida", realeaseDate: releaseSeason2, season: season2)
        let episode2Season2 = Episode(title: "Las tierras de la noche", realeaseDate: episode1Season2.releaseDate.releaseDate(sinceDate: episode1Season2.releaseDate), season: season2)
        let episode3Season2 = Episode(title: "Lo que está muerto no puede morir", realeaseDate: episode2Season2.releaseDate.releaseDate(sinceDate: episode2Season2.releaseDate), season: season2)
        let episode4Season2 = Episode(title: "Jardín de huesos", realeaseDate: episode3Season2.releaseDate.releaseDate(sinceDate: episode3Season2.releaseDate), season: season2)
        let episode5Season2 = Episode(title: "El fantasma de Harrenhal", realeaseDate: episode4Season2.releaseDate.releaseDate(sinceDate: episode4Season2.releaseDate), season: season2)
        let episode6Season2 = Episode(title: "Los dioses antiguos y nuevos", realeaseDate: episode5Season2.releaseDate.releaseDate(sinceDate: episode5Season2.releaseDate), season: season2)
        let episode7Season2 = Episode(title: "Un hombre sin honor", realeaseDate: episode6Season2.releaseDate.releaseDate(sinceDate: episode6Season2.releaseDate), season: season2)
        let episode8Season2 = Episode(title: "Un príncipe de Invernalia", realeaseDate: episode7Season2.releaseDate.releaseDate(sinceDate: episode7Season2.releaseDate), season: season2)
        let episode9Season2 = Episode(title: "Aguasnegras", realeaseDate: episode8Season2.releaseDate.releaseDate(sinceDate: episode8Season2.releaseDate), season: season2)
        let episode10Season2 = Episode(title: "Valar Morghulis", realeaseDate: episode9Season2.releaseDate.releaseDate(sinceDate: episode9Season2.releaseDate), season: season2)
        
        //Temporada 3
        let episode1Season3 = Episode(title: "Valar Dohaeris", realeaseDate: releaseSeason3, season: season3)
        let episode2Season3 = Episode(title: "Alas negras, palabras negras", realeaseDate: episode1Season3.releaseDate.releaseDate(sinceDate: episode1Season3.releaseDate), season: season3)
        let episode3Season3 = Episode(title: "Camino del castigo", realeaseDate: episode2Season3.releaseDate.releaseDate(sinceDate: episode2Season3.releaseDate), season: season3)
        let episode4Season3 = Episode(title: "Y ahora su guardia ha terminado", realeaseDate: episode3Season1.releaseDate.releaseDate(sinceDate: episode3Season3.releaseDate), season: season3)
        let episode5Season3 = Episode(title: "Besado por el fuego", realeaseDate: episode4Season3.releaseDate.releaseDate(sinceDate: episode4Season3.releaseDate), season: season3)
        let episode6Season3 = Episode(title: "El ascenso", realeaseDate: episode5Season3.releaseDate.releaseDate(sinceDate: episode5Season3.releaseDate), season: season3)
        let episode7Season3 = Episode(title: "El oso y la doncella", realeaseDate: episode6Season3.releaseDate.releaseDate(sinceDate: episode6Season3.releaseDate), season: season3)
        let episode8Season3 = Episode(title: "Los Segundos Hijos", realeaseDate: episode7Season3.releaseDate.releaseDate(sinceDate: episode7Season3.releaseDate), season: season3)
        let episode9Season3 = Episode(title: "Las lluvias de Castamere", realeaseDate: episode8Season3.releaseDate.releaseDate(sinceDate: episode8Season3.releaseDate), season: season3)
        let episode10Season3 = Episode(title: "Mhysa", realeaseDate: episode9Season3.releaseDate.releaseDate(sinceDate: episode9Season3.releaseDate), season: season3)
        
        //Temporada 4
        let episode1Season4 = Episode(title: "Dos espadas", realeaseDate: releaseSeason4, season: season4)
        let episode2Season4 = Episode(title: "El león y la rosapadas", realeaseDate: episode1Season4.releaseDate.releaseDate(sinceDate: episode1Season4.releaseDate), season: season4)
        let episode3Season4 = Episode(title: "Rompedora de cadenas", realeaseDate: episode2Season4.releaseDate.releaseDate(sinceDate: episode2Season4.releaseDate), season: season4)
        let episode4Season4 = Episode(title: "Guardajuramentos", realeaseDate: episode3Season4.releaseDate.releaseDate(sinceDate: episode3Season4.releaseDate), season: season4)
        let episode5Season4 = Episode(title: "Primero de su nombre", realeaseDate: episode4Season4.releaseDate.releaseDate(sinceDate: episode4Season4.releaseDate), season: season4)
        let episode6Season4 = Episode(title: "Leyes de Dioses y hombres", realeaseDate: episode5Season4.releaseDate.releaseDate(sinceDate: episode5Season4.releaseDate), season: season4)
        let episode7Season4 = Episode(title: "El sinsonte", realeaseDate: episode6Season4.releaseDate.releaseDate(sinceDate: episode6Season4.releaseDate), season: season4)
        let episode8Season4 = Episode(title: "La montaña y la víbora", realeaseDate: episode7Season4.releaseDate.releaseDate(sinceDate: episode7Season4.releaseDate), season: season4)
        let episode9Season4 = Episode(title: "Los guardianes en el muro", realeaseDate: episode8Season4.releaseDate.releaseDate(sinceDate: episode8Season4.releaseDate), season: season4)
        let episode10Season4 = Episode(title: "Los niños", realeaseDate: episode9Season4.releaseDate.releaseDate(sinceDate: episode9Season4.releaseDate), season: season4)
        
        //Temporada 5
        let episode1Season5 = Episode(title: "The Wars to Come", realeaseDate: releaseSeason5, season: season5)
        let episode2Season5 = Episode(title: "The House of Black and White", realeaseDate: episode1Season5.releaseDate.releaseDate(sinceDate: episode1Season5.releaseDate), season: season5)
        let episode3Season5 = Episode(title: "High Sparrow", realeaseDate: episode2Season5.releaseDate.releaseDate(sinceDate: episode2Season5.releaseDate), season: season5)
        let episode4Season5 = Episode(title: "The Sons Of The Harpy", realeaseDate: episode3Season5.releaseDate.releaseDate(sinceDate: episode3Season5.releaseDate), season: season5)
        let episode5Season5 = Episode(title: "Kill The Boy", realeaseDate: episode4Season5.releaseDate.releaseDate(sinceDate: episode4Season5.releaseDate), season: season5)
        let episode6Season5 = Episode(title: "Unbowed, Unbent, Unbroken", realeaseDate: episode5Season5.releaseDate.releaseDate(sinceDate: episode5Season5.releaseDate), season: season5)
        let episode7Season5 = Episode(title: "The Gift", realeaseDate: episode6Season5.releaseDate.releaseDate(sinceDate: episode6Season5.releaseDate), season: season5)
        let episode8Season5 = Episode(title: "Hardhome", realeaseDate: episode7Season5.releaseDate.releaseDate(sinceDate: episode7Season5.releaseDate), season: season5)
        let episode9Season5 = Episode(title: "The Dance of Dragons", realeaseDate: episode8Season5.releaseDate.releaseDate(sinceDate: episode8Season5.releaseDate), season: season5)
        let episode10Season5 = Episode(title: "Mother’s Mercy", realeaseDate: episode9Season5.releaseDate.releaseDate(sinceDate: episode9Season5.releaseDate), season: season5)
        
        //Temporada 6
        let episode1Season6 = Episode(title: "The Red Woman", realeaseDate: releaseSeason6, season: season6)
        let episode2Season6 = Episode(title: "Home", realeaseDate: episode1Season6.releaseDate.releaseDate(sinceDate: episode1Season6.releaseDate), season: season6)
        let episode3Season6 = Episode(title: "Oathbreaker", realeaseDate: episode2Season6.releaseDate.releaseDate(sinceDate: episode2Season6.releaseDate), season: season6)
        let episode4Season6 = Episode(title: "Book of the Stranger", realeaseDate: episode3Season6.releaseDate.releaseDate(sinceDate: episode3Season6.releaseDate), season: season6)
        let episode5Season6 = Episode(title: "The Door", realeaseDate: episode4Season6.releaseDate.releaseDate(sinceDate: episode4Season6.releaseDate), season: season6)
        let episode6Season6 = Episode(title: "Blood of My Blood", realeaseDate:episode5Season6.releaseDate.releaseDate(sinceDate: episode5Season6.releaseDate), season: season6)
        let episode7Season6 = Episode(title: "The Broken Man", realeaseDate: episode6Season6.releaseDate.releaseDate(sinceDate: episode6Season6.releaseDate), season: season6)
        let episode8Season6 = Episode(title: "No One", realeaseDate: episode7Season6.releaseDate.releaseDate(sinceDate: episode7Season6.releaseDate), season: season6)
        let episode9Season6 = Episode(title: "Battle of Bastards", realeaseDate: episode8Season6.releaseDate.releaseDate(sinceDate: episode8Season6.releaseDate), season: season6)
        let episode10Season6 = Episode(title: "The Winds of Winter", realeaseDate: episode9Season6.releaseDate.releaseDate(sinceDate: episode9Season6.releaseDate), season: season6)
        
        //Temporada 7
        let episode1Season7 = Episode(title: "Dragonstone", realeaseDate: releaseSeason7, season: season7)
        let episode2Season7 = Episode(title: "Stormborn", realeaseDate: episode1Season7.releaseDate.releaseDate(sinceDate: episode1Season7.releaseDate), season: season7)
        let episode3Season7 = Episode(title: "The Queen's Justice", realeaseDate: episode2Season7.releaseDate.releaseDate(sinceDate: episode2Season7.releaseDate), season: season7)
        let episode4Season7 = Episode(title: "Episode", realeaseDate: episode3Season7.releaseDate.releaseDate(sinceDate: episode3Season7.releaseDate), season: season7)
        let episode5Season7 = Episode(title: "Episode", realeaseDate: episode4Season7.releaseDate.releaseDate(sinceDate: episode4Season7.releaseDate), season: season7)
        let episode6Season7 = Episode(title: "Episode", realeaseDate: episode5Season7.releaseDate.releaseDate(sinceDate: episode5Season7.releaseDate), season: season7)
        let episode7Season7 = Episode(title: "Episode", realeaseDate: episode6Season7.releaseDate.releaseDate(sinceDate: episode6Season7.releaseDate), season: season7)
        let episode8Season7 = Episode(title: "Episode", realeaseDate: episode7Season7.releaseDate.releaseDate(sinceDate: episode7Season7.releaseDate), season: season7)
        let episode9Season7 = Episode(title: "Episode", realeaseDate: episode8Season7.releaseDate.releaseDate(sinceDate: episode8Season7.releaseDate), season: season7)
        let episode10Season7 = Episode(title: "Episode", realeaseDate: episode9Season7.releaseDate.releaseDate(sinceDate: episode9Season7.releaseDate), season: season7)
        
        //Agregar los episodios a las temporadas
        season1.addEpisode(newEpisode: episode1Season1)
        dump(episode1Season1)
        season1.addEpisode(newEpisode: episode2Season1)
        dump(episode2Season1.releaseDate)
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
        return  [season1, season2, season3, season4, season5, season6, season7].sorted(by: { (seasonA, seasonB) -> Bool in
            return seasonA.releaseDate < seasonB.releaseDate
        })
    }
    
    func seasonRequired(seasonName: String) -> Season? {
        let season = seasons.filter{
            $0 .seasonName.uppercased() == seasonName.uppercased()
            }.first
        return season
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
    func releaseDate (sinceDate:Date) -> Date{
        let interval = 604800.0
        let releaseDate = Date(timeInterval: interval, since: sinceDate)
        return releaseDate
    }
}







































