//
//  EpisodeViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 31/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var espisodeNameLabel: UILabel!

    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var episodeModel: Episode
    
    init(episodeModel: Episode){
        self.episodeModel = episodeModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
}



















