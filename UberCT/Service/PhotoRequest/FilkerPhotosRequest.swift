//
//  FilkerPhotosRequest.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation

protocol FlikrPhotosRequesting {
    func request(with text: String, page: Int, completion:@escaping (FlikrPhotos?, FlikrResponseError?) -> Void) -> URLSessionDataTask?
}

class FlikrPhotosRequest: FlikrPhotosRequesting {
    
    func request(with text: String, page: Int, completion:@escaping (FlikrPhotos?, FlikrResponseError?) -> Void) -> URLSessionDataTask? {
        
        //We can use queryItems for this, since this is a single GET url, i am managing it with string operations
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736&%20format=json&nojsoncallback=1&safe_search=1&text=\(text)&page=\(page)"
       
        guard let url = URL.init(string: urlString) else {
            let error = FlikrResponseError(errorKind: .urlError)
            completion(nil, error)
            return nil
        }
       
        return ServiceRequest.request(with: url, params: nil) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print(httpResponse.statusCode)
            guard httpResponse.statusCode == 200 else {return}
            
            if let jsonData = data {
                let photos = try? JSONDecoder().decode(FlikrPhotos.self, from: jsonData)
                completion(photos, nil)
            }else {
                let error = FlikrResponseError.init(errorKind: .unknown)
                completion(nil, error)
            }
            
        }
        
    }

}
