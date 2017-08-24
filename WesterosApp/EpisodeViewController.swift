//
//  EpisodeViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 31/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var espisodeNameLabel: UILabel!

    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var reposity = Repository.local
    var houses = Repository.local.houses
    
    let cellID = "CellIdentifier"
    
    var episodeModel: Episode
    
    init(episodeModel: Episode){
        self.episodeModel = episodeModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func syncViewWithModel (){
        espisodeNameLabel.text = episodeModel.title
        releaseDateLabel.text = episodeModel.releaseDate.formatter(date: episodeModel.releaseDate)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let allHousesMembers = reposity.allHousesMembers(houses: houses)
        
        return allHousesMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allHousesMembers = reposity.allHousesMembers(houses: houses)
        
        let characterToCell = allHousesMembers[indexPath.row]
        
        var cellCharacter = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cellCharacter == nil{
            cellCharacter = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        cellCharacter?.textLabel?.text = characterToCell.name
        cellCharacter?.detailTextLabel?.text = "de la casa:  \(characterToCell.house.name)"
        cellCharacter?.imageView?.image = characterToCell.house.sigil.image

        return cellCharacter!
    }
    
}



















