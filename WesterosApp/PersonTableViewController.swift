//
//  PersonTableViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 18/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    let cellID = "PersonCellIdentifier"
    let personModel:[Person]
    
    init(personModel: [Person]) {
        
        self.personModel = personModel
        super.init(nibName: nil, bundle: nil)
        title = "Futuros Fiambres"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personToCell = personModel[indexPath.row]
        
        var personCell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if personCell == nil{
            personCell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        personCell?.textLabel?.text = personToCell.name
        personCell?.imageView?.image = personToCell.house.sigil.image
        
        return personCell!
    }
    
}



































