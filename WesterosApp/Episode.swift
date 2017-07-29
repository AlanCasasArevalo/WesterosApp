//
//  Episode.swift
//  WesterosApp
//
//  Created by Alan Casas on 28/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit



final class Episode {
    
    var title: String
    var releaseDate : Date
    
    init ( title: String, realeaseDate: Date ){
        
        (self.title, self.releaseDate ) = (title , realeaseDate)
        
    }
    
}

extension Episode{
    
    var proxy : String {
        return "\(title) \(releaseDate)"
    }
    
}

extension Episode: Hashable{
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}


extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}




























