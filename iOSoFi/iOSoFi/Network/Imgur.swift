//
//  Imgur.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/17/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation
import Moya

public enum Imgur {
    static private let clientId = "6c9905e140b8d71"
    
    case search
}

let imgurView = SearchController()

extension Imgur: TargetType {
    public var baseURL: URL {
        return URL(string: "​https://api.imgur.com/3/gallery/search/time")!
        ///\​(page number)?q=\(search parameters)
    }
    
    public var path: String {
        switch self {
        case .search: return "/?q=\(imgurView.imgurSearchBar)"
        }
    }
    
    public var method: Moya.Method {
      switch self {
      case .search: return .get
      }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        let ts = "\(Date().timeIntervalSince1970)"
        
        let hash = (ts + Imgur.clientId)
        
        let authParams = ["apiKey": Imgur.clientId, "ts": ts, "hash": hash]
        
        switch self {
        case .search:
            
            return .requestParameters(
                parameters: [
                "sort": "top",
                "window": "all",
                "page": 50],
                encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [
          "Authorization": "Client-ID \(Imgur.clientId)",
          "Content-Type": "application/json",
        ]
    }
    
    public var validationTypes: ValidationType {
        return .successCodes
    }
}
