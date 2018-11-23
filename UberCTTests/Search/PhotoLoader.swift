//
//  PhotoLoader.swift
//  UberCTTests
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation
@testable import UberCT

class PhotosLoader {
    
    static func photos() -> [Photo] {
        let photo1 = createPhoto(id: "1")
        let photo2 = createPhoto(id: "2")
        let photo3 = createPhoto(id: "3")
        
        return [photo1, photo2, photo3]
    }
    
    static func createPhoto(id: String?, owner: String? = nil, secret: String? = nil, server: String? = nil, farm: Int? = nil, title: String? = nil, ispublic: Bool? = nil, isfriend: Bool? = nil, isfamily: Bool? = nil) -> Photo {
        let photo = Photo(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title, ispublic: ispublic, isfriend: isfriend, isfamily: isfamily)
        return photo
    }
}
