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
    
    var fecha:Date!
    var season1:Season!

    override func setUp() {
        super.setUp()
        
        fecha = Date(timeIntervalSinceNow: 0)
        season1 = Season(seasonName: "Temporada1", realeaseDate: fecha)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){

        XCTAssertNotNil(season1)
        
    }
    
    func testAddEpisodeToSeason(){
        let pilote = Episode(title: "piloto", realeaseDate: fecha)
        
        season1.addEpisode(newEpisode: pilote)
        
        XCTAssertEqual(season1.count, 1)
        
    }
    
    func testSeasonEquality(){
        
        XCTAssertEqual(season1, season1)
        
    }

}
































