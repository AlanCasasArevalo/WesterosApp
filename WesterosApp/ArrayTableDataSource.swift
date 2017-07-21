//
//  ArrayDataSource.swift
//  WesterosApp
//
//  Created by Alan Casas on 18/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

final class ArrayTableDataSource <Element> :NSObject, UITableViewDataSource{
    
    typealias Elements = [Element]
    
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model: Elements
    
    private let _cellMaker:CellMaker
    
    init ( model: Elements, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Cual es el modelo
        let element = _model[indexPath.row]
        
        //Mostrar la celda
        return _cellMaker(element, tableView)
        
    }
    
}































