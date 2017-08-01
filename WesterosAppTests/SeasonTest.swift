//
//  SeasonTest.swift
//  WesterosApp
//
//  Created by Alan Casas on 29/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class SeasonTest: XCTestCase {
    
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
    
    var episode0: Episode!
    var episode1: Episode!
    
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
        episode1 = Episode(title: "Capitulo 2", realeaseDate: releaseSeason, season: season2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){

        XCTAssertNotNil(season1)
        XCTAssertNotNil(season2)
        XCTAssertNotNil(season3)
        XCTAssertNotNil(season4)
        XCTAssertNotNil(season5)
        XCTAssertNotNil(season6)
        XCTAssertNotNil(season7)
        
    }
    
    func testAddEpisodeToSeason(){
        let pilote1 = Episode(title: "piloto", realeaseDate: releaseSeason, season: season1)
        
        season1.addEpisode(newEpisode: pilote1)
        
        let pilote2 = Episode(title: "piloto2", realeaseDate: releaseSeason, season: season2)
        
        XCTAssertEqual(season1.seasonCount, 11)

        season2.addEpisode(newEpisode: pilote2)
        
        XCTAssertEqual(season2.seasonCount, 11)
    }
    
    func testSeasonEquality(){
        XCTAssertEqual(season1, season1)
        let temporada1 = Season(seasonName: "Temporada 1", realeaseDate: releaseSeason)
        XCTAssertEqual(temporada1, season1)
        XCTAssertNotEqual(season4, season1)
    }

    func testSeasonHashable(){
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparable(){
        XCTAssertLessThan(season1, season2)
        XCTAssertGreaterThan(season2, season1)
    }

    func testSeasonComparison () {
        XCTAssertTrue(season1 < season2)
    }
    
    func testSeasonRequired() {
        seasonRequired = Repository.local.seasonRequired(seasonName: "Temporada 1")
        XCTAssertNotNil(seasonRequired)
        XCTAssertEqual(seasonRequired, season1)
    }
    
    func testFailSeasonRequired() {
        seasonRequired = Repository.local.seasonRequired(seasonName: "Temporada")
        XCTAssertNil(seasonRequired)
        XCTAssertNotEqual(seasonRequired, season1)
    }

//    func testHouseRequired (){
//        
//        houseRequired = Repository.local.houseRequired(houseName: "Stark")
//        
//        print("La casa requerida es: ************")
//        print(houseRequired.name)
//        
//        XCTAssertNotNil(houseRequired)
//        XCTAssertEqual(houseRequired, starkHouse)
//    }
//    
//    
//    func testFailHouseRequired (){
//        
//        houseRequired = Repository.local.houseRequired(houseName: "Star")
//        
//        print("La casa requerida es: ************")
//        
//        XCTAssertNil(houseRequired)
//        XCTAssertNotEqual(houseRequired, starkHouse)
//    }
}
































