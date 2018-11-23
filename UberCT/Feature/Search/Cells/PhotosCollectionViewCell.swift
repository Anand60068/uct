//
//  PhotosCollectionViewCell.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    func configure(photo: Photo) {
        let placeHolder = UIImage.init(named: "placeholder-image")
        imageView.image = placeHolder
        guard let imageurl = photo.urlForPhoto() else {return}
        print(imageurl)
        imageView.load(url: imageurl)
        
    }
    
    override func prepareForReuse() {
        let placeHolder = UIImage.init(named: "placeholder-image")
        imageView.image = placeHolder
    }

}
