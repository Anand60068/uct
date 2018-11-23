//
//  FlikrPhotoSearchRouter.swift
//  UberCT
//
//  Created Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//
//

import UIKit

class FlikrPhotoSearchRouter: FlikrPhotoSearchRouting {
    
    weak var view: FlikrPhotoSearchViewController?
    
    static func make() -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "FlikrPhotoSearch", bundle: nil)
        guard let view = storyboard.instantiateInitialViewController() as? FlikrPhotoSearchViewController else {
            return UIViewController()
        }

        let interactor = FlikrPhotoSearchInteractor()
        let router = FlikrPhotoSearchRouter()
        let presenter = FlikrPhotoSearchPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.consumer = presenter
        presenter.interactor = interactor
        router.view = view

        return view
    }
}
