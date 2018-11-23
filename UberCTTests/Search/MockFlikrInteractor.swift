//
//  MockFlikrInteractor.swift
//  UberCTTests
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation
@testable import UberCT

class MockFlikrInteractor: FlikrPhotoSearchInteracting {
    
    var fetchCallCount = 0
    
    var presenter: FlikrPhotoSearchPresenting?
    
    func fetchPhotos(with searchText: String, page: Int) {
        fetchCallCount += 1
    }
    
    
}
