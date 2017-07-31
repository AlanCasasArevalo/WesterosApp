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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        let timeInterval = 0.0
        let hoy = Date(timeIntervalSinceNow: timeInterval)
        let episode = Episode(title: "", realeaseDate: hoy)
        print( " Fecha de hoy \(hoy)")
        
        XCTAssertNotNil(episode)
        
    }
    
}

























