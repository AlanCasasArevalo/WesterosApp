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
    
    var season:Season!
    
    var episode1 : Episode!
    var currentDate : Date!

    var episode2 : Episode!
    var currentDate2 : Date!
    
    override func setUp() {
        super.setUp()
        
        
        currentDate = Date(timeIntervalSinceNow: 00)
        
        season = Season(seasonName: "Temporada 1", realeaseDate: currentDate)
        
        episode1 = Episode(title: "Pilote", realeaseDate: currentDate, season: season)
        
        currentDate2 = Date(timeIntervalSinceNow: 100)
        episode2 = Episode(title: "Pilote", realeaseDate: currentDate2, season: season)


    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode1)
        
    }
    
    func testSeasonEquality(){
        
        XCTAssertEqual(episode1, episode1)
        XCTAssertNotEqual(episode1, episode2)
        
    }
    
    func testSeasonHashable(){
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testSeasonComparable(){
        
        XCTAssertLessThan(episode1, episode2)
        XCTAssertGreaterThan(episode2, episode1)
        
    }

    
}

























