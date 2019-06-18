//
//  UploadResult.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/17/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

struct UploadResult: Codable, CustomDebugStringConvertible {
    let deleteHash: String
    let link: URL
    
    var debugDescription: String {
        return "<UploadResult:\(deleteHash)> \(link)"  
    }
}
