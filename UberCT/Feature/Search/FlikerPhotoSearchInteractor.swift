//
//  FlikrPhotoSearchInteractor.swift
//  UberCT
//
//  Created Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//
//

import UIKit

class FlikrPhotoSearchInteractor: FlikrPhotoSearchInteracting {

    weak var presenter: FlikrPhotoSearchPresenting?
    var request: FlikrPhotosRequesting
    weak var consumer: FlikrPhotosConsuming?
    var dataTask: URLSessionDataTask?
    
    init(request: FlikrPhotosRequesting = FlikrPhotosRequest()) {
        self.request = request
    }
    
    func fetchPhotos(with searchText: String, page: Int) {
         if dataTask != nil {
            consumer?.requestInProcess()
            return
        }
         dataTask = request.request(with: searchText, page: page) { (response, error) in
            self.dataTask = nil
            guard let photos = response?.photos?.photo else {
                self.consumer?.didFinishLoadingFailed(photos: nil)
                return
            }
            if error != nil {
                self.consumer?.didFinishLoadingFailed(photos: error)
            }else {
                self.consumer?.didFinishLoadingSuccess(photos: photos)
            }
        }
    }
}
