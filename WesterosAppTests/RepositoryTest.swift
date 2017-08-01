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

    //****** HOUSE ******//
    var aenar:Person!
    var renly : Person!
    
    var starkHouse : House!
    var lannisterHouse : House!
    var targaryenHouse:House!
    var baratheonHouse:House!

    //****** SEASON ******//
    var repositorySeason: [Season]!

    var episode1:Episode!
    var episode2:Episode!
    
    var season1:Season!
    var season2:Season!
    var season3:Season!
    var season4:Season!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        repositoryHouse = Repository.local.houses
        
        repositorySeason = Repository.local.seasons
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
        let filtered = Repository.local.houseFiltered(filteredBy: {$0.houseCount == 3 })
        XCTAssertEqual(filtered.count, 3)
    }

    func testRepositorySeasonExistence()  {
        XCTAssertNotNil(repositorySeason)
    }

    func testLocalRepositorySeasonCreation(){
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 7)
        XCTAssertNotEqual(seasons.count, 4)
    }
    
    func testSeasonReturnsShorted(){
        XCTAssertEqual(repositorySeason, repositorySeason.sorted())
    }
    
    func testReleaseDate(){
        
        let dateComponentReleaseSeason1 = DateComponents(calendar: .current, year: 2011, month: 04, day: 11)
        let releaseSeason1 = dateComponentReleaseSeason1.date!

        season1 = Season(seasonName: "Temporada 1", realeaseDate: releaseSeason1)
        
        episode1 = Episode(title: "Se acerca el invierno", realeaseDate: releaseSeason1, season: season1)
        episode2 = Episode(title: "El camino real", realeaseDate: episode1.releaseDate.releaseDate(sinceDate: episode1.releaseDate), season: season1)

        season1.addEpisode(newEpisode: episode1)
        season1.addEpisode(newEpisode: episode2)

        dump(season1)
        
        XCTAssertNotNil(episode2.releaseDate)
    }
    
    func testSeasonFilteringBySeasonCount(){

        let filtered = Repository.local.seasonFiltered { (season) -> Bool in
            season.seasonCount == 10
        }
        XCTAssertEqual(filtered.count, 7)
        
    }
    
    func testSeasonFilteringBySeasonName(){
        let filtered = Repository.local.seasonFiltered (filteredBy:{$0.seasonName == "Temporada 1"})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFilteringBy (){
        let filter = Repository.local.seasonFiltered { (season) -> Bool in
            season.seasonName == "Temporada 2"
        }
    
        XCTAssertEqual(filter.count, 1)
    }
    
}































