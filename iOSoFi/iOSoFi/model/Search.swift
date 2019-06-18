//
//  Search.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/18/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

struct Search: Codable {
    let id: String
    let title: String
    let description: String?
    let tags: Tags
    let images: Thumbnail
    
}

extension Search: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<Search: \(id)> \(title) with \(images)"
    }
}

extension Search {
    struct Thumbnail: Codable {
        let link: String
        
        var url: URL {
            return URL(string: link)!
        }
    }
}

extension Search {
    struct Tags: Codable {
        let name: String
        let link: String
    }
}
