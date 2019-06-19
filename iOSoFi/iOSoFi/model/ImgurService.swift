//
//  ImgurService.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/19/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

public enum APIResult {
    case success
    case failure(_ error: String?)
}

public enum ImgurAuth {
    static private let clientSecret = "285b5ddab6ca9eaddb04060c58a26770d6633e76"
    
}

public class ImgurService {
    
    static let clientId = "6c9905e140b8d71"
    static let defaults = UserDefaults.standard
    
    public static var auth: String? {
        get {
            return defaults.string(forKey: ImgurService.clientId)
        }
        set {
            return defaults.set(newValue, forKey: ImgurService.clientId)
        }
    }

    func imgurService(id: String, title: String, description: String, _ searchData: String, completion: @escaping (APIResult) -> Void) {
        
        let imgurRequest = ImgurRequest(id: id, title: title, description: description)
        let imgurJSON = try! JSONEncoder().encode(imgurRequest)

        let url = URL(string: ImgurApi.baseUrl + "/" + ImgurApi.query)
        var request = URLRequest(url: url!)
        request.httpBody = imgurJSON
        request.addValue("Authorization", forHTTPHeaderField: "Client-ID \(ImgurService.clientId)")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, _  in
            DispatchQueue.main.async {
                guard let jsonData = data else {
                    completion(.failure(nil))
                    return
                }
                
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    200..<300 ~= httpResponse.statusCode else {
                        do {
                            let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                            if let error = json?["reason"] as? String  {
                                completion(.failure(error))
                                return
                            }
                        } catch {}
                        completion(.failure(nil))
                        return
                }
                completion(.success)
            }
        }
        .resume()
    }
}

//MARK: - Private Structure

final class Auth: Codable {
    var auth: String
    var clientID: UUID
    
    init(auth: String, clientID: UUID) {
        self.auth = auth
        self.clientID = clientID
    }
}
