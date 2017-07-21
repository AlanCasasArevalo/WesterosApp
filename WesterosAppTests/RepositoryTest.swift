//
//  RepositorioTests.swift
//  Poniente
//
//  Created by Alan Casas on 13/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class RepositorioTests: XCTestCase {
    
    var repositoryHouse:[House]!
    
    var aenar:Person!
    var renly : Person!
    
    
    var starkHouse : House!
    var lannisterHouse : House!
    var targaryenHouse:House!
    var baratheonHouse:House!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        repositoryHouse = Repository.local.houses
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 4)
    }
    
    func testLocalRepositoryReturnsSortedArrayofHouses(){
        
        XCTAssertEqual(repositoryHouse, repositoryHouse.sorted())
    }
    
    
    
    
    func testHouseFiltering(){
  
        let filtered = Repository.local.houseFiltered(filteredBy: {$0.count == 3 })
        XCTAssertEqual(filtered.count, 3)

    }
}































