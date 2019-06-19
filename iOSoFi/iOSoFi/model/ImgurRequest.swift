//
//  Search.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/18/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

struct ImgurRequest: Codable {
    let id: String
    let title: String
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
    }
}



