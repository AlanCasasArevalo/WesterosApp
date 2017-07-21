//
//  DataSources.swift
//  WesterosApp
//
//  Created by Alan Casas on 19/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

final class DataSource{
    static func houseDataSource(model:[House]) -> ArrayTableDataSource <House>{
        
        return ArrayTableDataSource(model: model, cellMaker: { (house:House, tableView:UITableView) -> UITableViewCell in
            
            let cellID = "houseCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) Miembros de la casa."
            cell?.imageView?.image = house.sigil.image
            
            return cell!
        })
        
    }
    
    static func memberDataSource(model: [Person]) -> ArrayTableDataSource <Person> {
        
        return ArrayTableDataSource(model: model, cellMaker: { (person:Person, tableView:UITableView) -> UITableViewCell in
            
            let cellID = "personCell"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        })
        
    }
    
}

























