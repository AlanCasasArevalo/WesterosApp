//
//  HousesTableViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 18/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    let cellID = "HouseCellIdentifier"
    let houseModel : [House]
    
    init(houseModel:[House]) {
        self.houseModel = houseModel
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -TABLE VIEW DATASOURCE
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return houseModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let houseToCell = houseModel[indexPath.row]
        
        var houseCell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if houseCell == nil {
            
            houseCell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            
        }
        
        houseCell?.imageView?.image = houseToCell.sigil.image
        houseCell?.textLabel?.text = houseToCell.name
        
        return houseCell!
    }

    //MARK: - TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar la casa
        let cellForRow = houseModel[indexPath.row]
        
        //Mostramos la casa
        let houseVC = HouseViewController(modelHouse: cellForRow)
        navigationController?.pushViewController(houseVC, animated: true)
        
//        optional public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    }
    
}




























