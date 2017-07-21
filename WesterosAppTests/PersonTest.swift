//
//  PersonTest.swift
//  WesterosApp
//
//  Created by Alan Casas on 8/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class PersonTest: XCTestCase {
    
    let houseFromRepository = Repository.local.houses
    
    var starkHouse  :House!
    var lannisterHouse : House!
    var targaryenHouse:House!
    var baratheonHouse:House!
    
    var arya:Person!
    var joffrey : Person!
    var daenerys:Person!
    var stannis:Person!
    
    
    override func setUp() {
        super.setUp()

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
        
        arya = starkHouse.personReturned(name: "Arya")
        joffrey = lannisterHouse.personReturned(name: "Joffrey")
        daenerys = targaryenHouse.personReturned(name: "Daenerys")
        stannis = baratheonHouse.personReturned(name: "Stannis")
    
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonsExistence()  {
                
        XCTAssertNotNil(daenerys)
        XCTAssertNotNil(joffrey)
        XCTAssertNotNil(arya)
        XCTAssertNotNil(stannis)
        
    }
    
    func testFullName(){
        XCTAssertEqual(daenerys.fullName, "Daenerys Targaryen")
    }
    
    func testPersonEquality(){
        
        //Identidad
        XCTAssertEqual(daenerys, daenerys)
        
//        igualdad
        let kaleshee = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        XCTAssertEqual(daenerys, kaleshee)
        
//         Desigualdad
        
        XCTAssertNotEqual(daenerys, arya)

    }
}














