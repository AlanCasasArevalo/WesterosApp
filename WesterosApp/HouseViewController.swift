//
//  HouseViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 10/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController,UISplitViewControllerDelegate  {
    
    
    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var houseWordView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    var modelHouse:House
    
    init(modelHouse: House) {

        self.modelHouse = modelHouse
        super.init(nibName: nil, bundle: nil)
        
        //Siempre tienen que estar inicializadas antes de hacer nada con las vistas, y mejor no usar nada de vistas en un init
        title = modelHouse.name
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        //Model => View
       
        houseNameView.text = modelHouse.name
        sigilImageView.image = modelHouse.sigil.image
        houseWordView.text = modelHouse.words
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }
    
    func setupUI(){
        // Creamos un botón a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki \(modelHouse.name)",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Personajes", style: .plain, target: self, action: #selector(displayMembers))
        
        navigationItem.rightBarButtonItems = [wiki,members]
    }

    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: modelHouse)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC,
                                                 animated: true)
    }
    
    @objc func displayMembers(){
        
        let membersVC = PersonTableViewController(personModel: modelHouse.sortedMembers())
        navigationController?.pushViewController(membersVC, animated: true)
        
    }
    
}



















