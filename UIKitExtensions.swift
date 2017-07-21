//
//  UIKitExtensions.swift
//  WesterosApp
//
//  Created by Alan Casas on 11/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}

