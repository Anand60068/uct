//
//  FlikrPhotoSearchViewController.swift
//  UberCT
//
//  Created Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//
//

import UIKit

class FlikrPhotoSearchViewController: UIViewController, FlikrPhotoSearchDisplaying {

    let reuseid = "com.photos.collectionid"
	var presenter: FlikrPhotoSearchPresenting!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        registerCells()
    }
    
    func registerCells() {
        let nib = UINib.init(nibName: "PhotosCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseid)
        
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    func showHud() {
        activityIndicator.startAnimating()
    }
    
    func hideHud() {
        activityIndicator.stopAnimating()
    }
    
}

extension FlikrPhotoSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.fetchPhotos(with: searchBar.text)
    }
    
    func resignResponder() {
        searchBar.resignFirstResponder()
    }
}

extension FlikrPhotoSearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseid, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let photo = presenter.item(at: indexPath) else {return UICollectionViewCell()}
        cell.configure(photo: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter.loadMore(for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width-10)/3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
}
