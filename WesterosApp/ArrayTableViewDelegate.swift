//
//  ArrayTableViewDelegate.swift
//  WesterosApp
//
//  Created by Alan Casas on 19/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate <Element> : NSObject, UITableViewDelegate{
    
    typealias Elements = [Element]
    
    typealias ViewController = (UITableView, Element)->()
    
    private let _model : Elements
    private let _viewController:ViewController
    
    init(model: Elements, viewController: @escaping ViewController ) {
        _model = model
        _viewController = viewController
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Se ha seleccionado una celda, que hay que hacer aqui?
        let element = _model[indexPath.row]
        
        //Mostrar la casa
        _viewController(tableView, element)
    }
    
}




























