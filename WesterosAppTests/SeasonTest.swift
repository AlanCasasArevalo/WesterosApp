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
    
    var dateSeason1:Date!
    var season1:Season!

    var dateSeason2:Date!
    var season2:Season!
    
    
    override func setUp() {
        super.setUp()
        
        dateSeason1 = Date(timeIntervalSinceNow: 0)
        season1 = Season(seasonName: "Temporada1", realeaseDate: dateSeason1)
        
        dateSeason2 = Date(timeIntervalSinceNow: 0)
        season2 = Season(seasonName: "Temporada2", realeaseDate: dateSeason1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){

        XCTAssertNotNil(season1)
        
    }
    
    func testAddEpisodeToSeason(){
        let pilote1 = Episode(title: "piloto", realeaseDate: dateSeason1, season: season1)
        
        
        season1.addEpisode(newEpisode: pilote1)
        
        let pilote2 = Episode(title: "piloto2", realeaseDate: dateSeason2, season: season2)
        
        XCTAssertEqual(season1.count, 1)

        season2.addEpisode(newEpisode: pilote2)
        
        XCTAssertEqual(season2.count, 1)
    }
    
    func testSeasonEquality(){
        
        XCTAssertEqual(season1, season1)
        
    }

    func testSeasonHashable(){
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparable(){
        
        XCTAssertLessThan(season1, season2)
        XCTAssertGreaterThan(season2, season1)
        
    }
    
    
}
































