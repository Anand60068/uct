//
//  UIImageView+Lazy.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func load(url: URL) {
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = imageFromCache
            return
        }
        
        _ = ServiceRequest.request(with: url, params: nil) { (data, response, error) in
            if let data = data, let image = UIImage.init(data: data) {
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                self.image = image
            }
        }
    }
    
}
