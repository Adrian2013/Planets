//
//  LazyImageView.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import UIKit


/// To handle the lazy loading
class LazyImageView : UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    
    /// To handle image caching
    /// - Parameters:
    ///   - imageURL: The url of the image
    ///   - placeHolderImage: The place holder image
    func loadImage(imageURL: URL, placeHolderImage: String){
        self.image = UIImage(named: placeHolderImage)
        
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }
            }
        }
        
    }
}

