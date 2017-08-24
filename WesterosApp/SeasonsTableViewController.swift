//
//  SeasonsTableViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 31/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class SeasonsTableViewController: UITableViewController {
    
    let cellID = "SeasonCellIdentifier"
    var seasonModel:[Season]

    init (seasonModel:[Season]){
        self.seasonModel = seasonModel
        super.init(nibName: nil, bundle: nil)
        title = "Temporadas"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return seasonModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let seasonToCell = seasonModel[indexPath.row]
        
        var seasonCell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if seasonCell == nil{
            seasonCell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        seasonCell?.textLabel?.text = " La \(seasonToCell.seasonName) contiene \(seasonToCell.seasonCount) capitulos "
        seasonCell?.detailTextLabel?.text = "Se estreno el dia \(String(describing: seasonToCell.releaseDate.formatter(date: seasonToCell.releaseDate)!))"
        
        return seasonCell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellForRow = seasonModel[indexPath.row]
        
        let episodeTableVC = EpisodeTableViewController(episodeModel: cellForRow)
        
        navigationController?.pushViewController(episodeTableVC, animated: true)
                
    }
    
}

extension Date{
    
    func formatter (date:Date) -> String? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")

//        let local = Locale.availableIdentifiers
//        print(local)
        formatter.dateFormat = "dd MMMM yyyy"

        return formatter.string(from: date)
    }
    
}































