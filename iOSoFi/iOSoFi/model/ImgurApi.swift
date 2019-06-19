//
//  ImgurApi.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/18/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

enum ImgurApi {
    
    static private let clientId = "6c9905e140b8d71"

    static let baseUrl = "https://api.imgur.com/3"
    
    static let query = "gallery/search/?q=cats"
    static let authClientId = ["Authorization" : "Client-ID \(clientId)"]
}
