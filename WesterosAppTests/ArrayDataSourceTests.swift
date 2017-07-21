//
//  ArrayDataSourceTests.swift
//  WesterosApp
//
//  Created by Alan Casas on 18/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
@testable import WesterosApp

class ArrayDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayDataSourceCreation(){
        
        let dataSource = ArrayTableDataSource(model: [1,2,3,4,5]) { (number:Int, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "numberCellId"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = " El numero \(number) "
            return cell!
        }
        
        XCTAssertNotNil(dataSource)
        
    }
    
}
