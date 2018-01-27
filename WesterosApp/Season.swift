//
//  Season.swift
//  WesterosApp
//
//  Created by Alan Casas on 28/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

typealias Episodes =  Set<Episode>

final class Season {
    
    var seasonName : String
    var releaseDate : Date
    var episode : Episodes
    
    init ( seasonName: String, realeaseDate: Date ){
        
        (self.seasonName, self.releaseDate ) = ( seasonName, realeaseDate)
    
        episode = Episodes()

    }
    
}

extension Season {
    var seasonCount :Int {
        return episode.count
    }
    
}

extension Season{
    func sortedEpisodes() -> [Episode] {
        let episodeArray: [Episode] = Array (episode)
        return episodeArray.sorted(by: { (episodeA, episodeB) -> Bool in
            return episodeA.releaseDate < episodeB.releaseDate
        })
    }
}

extension Season {
    func episodeReturned(titleRequired :String) -> Episode? {
        var episodeRequire: Episode?
        
        for episode in episode{
            if episode.title == titleRequired{
                episodeRequire = episode
            }
        }
        return episodeRequire
    }
}

extension Season{
    
    func addEpisode(newEpisode: Episode){
        episode.insert(newEpisode)
    }
    
    
}

extension Season{
    var proxy : String {
        return "\(seasonName) \(releaseDate)"
    }
}

extension Season{
    var proxyForEquality: String {
        return "\(seasonName) \(releaseDate)"
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        return "\(releaseDate)"
    }
}

extension Season: Hashable{

    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}




















