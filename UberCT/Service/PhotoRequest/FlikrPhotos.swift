//
//  FlickerPhotos.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//  let photos = try? newJSONDecoder().decode(FlikrPhotos.self, from: jsonData)

import Foundation

struct FlikrPhotos: Codable {
    let photos: Photos?
    let stat: String?
}

struct Photos: Codable {
    let page, pages, perpage: Int?
    let total: String?
    let photo: [Photo]?
}

struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
}
