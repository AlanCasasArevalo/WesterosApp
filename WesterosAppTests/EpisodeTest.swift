//
//  EpisodeTest.swift
//  WesterosApp
//
//  Created by Alan Casas on 29/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class EpisodeTest: XCTestCase {
    
    var seasonFromRepository = Repository.local.seasons
    var seasonRequired : Season!
    
    var season1:Season!
    var season2:Season!
    var season3:Season!
    var season4:Season!
    var season5:Season!
    var season6:Season!
    var season7:Season!
    
    var dateComponentReleaseSeason = DateComponents()
    var releaseSeason: Date!
    
    var episode0:Episode!
    var episode1:Episode!
    
    override func setUp() {
        super.setUp()
        
        for season in seasonFromRepository {
            
            switch season.seasonName {
            case "Temporada 1":
                season1 = season
            case "Temporada 2":
                season2 = season
            case "Temporada 3":
                season3 = season
            case "Temporada 4":
                season4 = season
            case "Temporada 5":
                season5 = season
            case "Temporada 6":
                season6 = season
            case "Temporada 7":
                season7 = season
            default:
                return
            }
        }
        
        dateComponentReleaseSeason = DateComponents(calendar: .current, year: 2011, month: 04, day: 11)
        releaseSeason = dateComponentReleaseSeason.date!

        episode0 = Episode(title: "Piloto", realeaseDate: releaseSeason, season: season1)
        episode1 = Episode(title: "Piloto 2", realeaseDate: releaseSeason, season: season1)
        
        print("El numero de episodios en la temporada 1 es de \(season1.seasonCount)")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode0)
    }
    
    func testEpisodeEquality(){
        let piloto = Episode(title: "Piloto", realeaseDate: releaseSeason, season: season1)
        
        XCTAssertEqual(piloto, episode0)
        
        XCTAssertEqual(episode1, episode1)
        XCTAssertNotEqual(episode0, episode1)
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComparable(){
        XCTAssertLessThan(episode1, episode0)
        XCTAssertGreaterThan(episode0, episode1)
    }
    
}

























