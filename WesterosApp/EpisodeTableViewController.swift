//
//  EpisodeTableViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 31/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class EpisodeTableViewController: UITableViewController {

    var episodeModel : [Episode]
    let CellID = "EpisodeCell"
    
    init (episodeModel:[Episode]){
        
        self.episodeModel = episodeModel
        super.init(nibName: nil, bundle: nil)
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
        return episodeModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episodeToCell = episodeModel[indexPath.row]
        
        var episodeCell = tableView.dequeueReusableCell(withIdentifier: CellID)

        if episodeCell == nil {
            episodeCell = UITableViewCell(style: .subtitle, reuseIdentifier: CellID)
        }
        
        episodeCell?.textLabel?.text = episodeToCell.title
        episodeCell?.detailTextLabel?.text = episodeToCell.releaseDate.formatter(date: episodeToCell.releaseDate)
        
        return episodeCell!
    }

}



























