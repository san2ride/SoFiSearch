//
//  CodableResponses.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/17/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

struct ImgurResponse<T: Codable>: Codable {
    let data: T
}
