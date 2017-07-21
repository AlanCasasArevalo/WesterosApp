//
//  ArrayTableViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 19/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class ArrayTableViewController <Element> : UITableViewController {
    
    let dataSource : ArrayTableDataSource <Element>
    let delegate : ArrayTableViewDelegate <Element>
    
    init(dataSource: ArrayTableDataSource <Element>, delegate : ArrayTableViewDelegate <Element> , title:String,  style : UITableViewStyle) {
        
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        
        self.title = title
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}





































