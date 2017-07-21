//
//  House.swift
//  WesterosApp
//
//  Created by Alan Casas on 7/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class HouseTests: XCTestCase {
    
    let houseFromRepository = Repository.local.houses
    var houseRequired:House!
    
    var starkHouse : House!
    var lannisterHouse : House!
    var targaryenHouse:House!
    var baratheonHouse : House!
    
    
    var robb:   Person!
    var arya:   Person!
    var tyrion: Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        for house in houseFromRepository{
            
            switch house.name {
            case "Stark":
                starkHouse = house
                break
            case "Lannister":
                lannisterHouse = house
                break
            case "Targaryen":
                targaryenHouse = house
                break
            case "Baratheon":
                baratheonHouse = house
                break
            default:
                break
            }
            
        }
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence()  {
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing"))
        
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister"))
        
        XCTAssertNotNil(lannisterSigil)

    }
    
    func testAddPersons(){
        
        XCTAssertEqual(starkHouse.count, 3)
        starkHouse.addPerson (person: robb)
        
        XCTAssertEqual(starkHouse.count, 3)
        starkHouse.addPerson (person: arya)
        
        XCTAssertEqual(starkHouse.count, 3)
        
        starkHouse.addPerson(person: tyrion)
        XCTAssertEqual(starkHouse.count, 3)
        
    }
    
    func testEquatableHouses(){
        XCTAssertEqual(starkHouse, starkHouse)
    }
    
    func testHouseEquality(){
//        Identidad
        
        XCTAssertEqual(starkHouse, starkHouse)
        
//        Igualdad
        let jinxed = starkHouse
        
        XCTAssertEqual(jinxed, starkHouse)
        
//        Desigualdad
        
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    
    func testHashable(){
        
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    
    func testHouseComparison() {
        
        XCTAssertTrue(lannisterHouse < starkHouse)
        
        XCTAssertLessThan(lannisterHouse, starkHouse)
        
    }
    
    func testHouseRequired (){
        
        houseRequired = Repository.local.houseRequired(houseName: "Stark")
        
        print("La casa requerida es: ************")
        print(houseRequired.name)
        
        XCTAssertNotNil(houseRequired)
        XCTAssertEqual(houseRequired, starkHouse)
    }
    
    
    func testFailHouseRequired (){

        houseRequired = Repository.local.houseRequired(houseName: "Star")

        print("La casa requerida es: ************")
        
        XCTAssertNil(houseRequired)
        XCTAssertNotEqual(houseRequired, starkHouse)
    }
    
}

































