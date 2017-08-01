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
    weak var season: Season?
    
    init ( title: String, realeaseDate: Date, season:Season ){
        
        (self.title, self.releaseDate, self.season ) = (title , realeaseDate, season)
        
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

extension Episode: CustomStringConvertible{
    var description: String {
        return "\(title) \(releaseDate)"
    }

}

























