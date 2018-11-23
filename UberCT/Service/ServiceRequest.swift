//
//  ServiceRequest.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation

//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736&%20format=json&nojsoncallback=1&safe_search=2&text=kittens&page=2

struct ServiceRequest {
    static func request(with  url: URL, params: [String: Any]?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
            
        }
        
        task.resume()
        return task
    }
}
