//
//  MockFlikrViewController.swift
//  UberCTTests
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

@testable import UberCT

import Foundation

class MockFlikrViewController: FlikrPhotoSearchDisplaying {
    
    var reloadCallCount = 0
    var resignCallCount = 0
    var setupUICallCount = 0
    var showHudCallCount = 0
    var hideCallCount = 0
   
    var presenter: FlikrPhotoSearchPresenting!
    
    func reloadCollectionView() {
        reloadCallCount += 1
    }
    
    func resignResponder() {
        resignCallCount += 1
    }
    
    func setupUI() {
        setupUICallCount += 1
    }
    
    func showHud() {
        showHudCallCount += 1
    }
    
    func hideHud() {
        hideCallCount += 1
    }
    
    
}
