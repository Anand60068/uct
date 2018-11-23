//
//  FlikrPhotoSearchContract.swift
//  UberCT
//
//  Created Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//
//

import Foundation
import UIKit

// MARK: Router -
protocol FlikrPhotoSearchRouting: class {
    var view: FlikrPhotoSearchViewController? {get set}
    static func make() -> UIViewController
}

// MARK: Presenter -
protocol FlikrPhotoSearchPresenting: FlikrPhotosConsuming {
    var view: FlikrPhotoSearchDisplaying? {get set}
    func fetchPhotos(with text: String?)
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> Photo?
    func viewDidLoad()
    func loadMore(for indexPath: IndexPath)
}

// MARK: Interactor -
protocol FlikrPhotoSearchInteracting: class {

  var presenter: FlikrPhotoSearchPresenting? {get set}
    func fetchPhotos(with searchText: String, page: Int)
}

// MARK: View -
protocol FlikrPhotoSearchDisplaying: class {

  var presenter: FlikrPhotoSearchPresenting! {get set}
    func reloadCollectionView()
    func resignResponder()
    func setupUI()
    func showHud()
    func hideHud()
}

protocol FlikrPhotosConsuming: class {
    func didFinishLoadingSuccess(photos: [Photo])
    func didFinishLoadingFailed(photos: FlikrResponseError?)
    func requestInProcess()
}
