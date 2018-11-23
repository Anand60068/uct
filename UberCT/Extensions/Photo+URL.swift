//
//  Photo+URL.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation

extension Photo {
    
    func urlForPhoto() -> URL? {
        //http://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg
        guard let farm = self.farm else {return nil}
        guard let server = self.server else {return nil}
        guard let id = self.id else {return nil}
        guard let secret = self.secret else {return nil}
        
        let urlString = "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
        return URL(string: urlString)
    }
}
