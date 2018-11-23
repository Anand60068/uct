//
//  FlikrPhotosViewModel.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation

struct FlikrPhotosViewModel {
    var searchText: String
    var page: Int
    var photos: [Photo] = [Photo]()
    
    init(searchText: String, page: Int) {
        self.searchText = searchText
        self.page = page
    }
}
