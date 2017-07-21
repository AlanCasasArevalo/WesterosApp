//
//  Delegates.swift
//  WesterosApp
//
//  Created by Alan Casas on 19/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

final class Delegates{
    static func housesDelegate (model: [House], navigatorController:UINavigationController) -> ArrayTableViewDelegate <House> {
        //Que va aqui??
        
        return ArrayTableViewDelegate(model: model, viewController: { (tableView:UITableView, house:House)->() in
            navigatorController.pushViewController(HouseViewController(modelHouse: house), animated:  true)
        })
    }
    
}
