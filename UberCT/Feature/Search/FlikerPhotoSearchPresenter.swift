//
//  FlikrPhotoSearchPresenter.swift
//  UberCT
//
//  Created Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//
//

import UIKit

class FlikrPhotoSearchPresenter: FlikrPhotoSearchPresenting {
  
    weak var view: FlikrPhotoSearchDisplaying?
    var interactor: FlikrPhotoSearchInteracting?
    var router: FlikrPhotoSearchRouting?
    var viewModel: FlikrPhotosViewModel!
    var loadedAll: Bool = false

    func viewDidLoad() {
        view?.setupUI()
    }
    
    //MARK: Collection Source
    func numberOfItems() -> Int {
        return viewModel.photos.count
    }
    
    func item(at indexPath: IndexPath) -> Photo? {
        return viewModel.photos[indexPath.row]
    }
    
    //MARK: Fetching
    func fetchPhotos(with text: String?) {
        guard let text = text, !text.isEmpty else {return}
        loadedAll = false
        viewModel = FlikrPhotosViewModel(searchText: text, page: 1)
        fetchPhotos()
    }
    
    func loadMore(for indexPath: IndexPath) {
        if indexPath.row == numberOfItems() - 1, loadedAll == false {
            viewModel.page += 1
            fetchPhotos()
        }
    }
    
    private func fetchPhotos() {
        view?.showHud()
        view?.resignResponder()
        interactor?.fetchPhotos(with: viewModel.searchText, page: viewModel.page)
    }
   
}
extension FlikrPhotoSearchPresenter: FlikrPhotosConsuming {
   
    func didFinishLoadingSuccess(photos: [Photo]) {
        view?.hideHud()
        if photos.count == 0 {
            loadedAll = true
            return
        }
        
        viewModel?.photos.append(contentsOf: photos)
        view?.reloadCollectionView()
    }
    
    func didFinishLoadingFailed(photos: FlikrResponseError?) {
        view?.hideHud()
    }
    
    func requestInProcess() {
        view?.hideHud()
    }
}
