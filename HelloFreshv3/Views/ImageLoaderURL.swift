//
//  CustomImageView.swift
//  ios-challenge
//
//  Created by Pablo de la Rosa Michicol on 8/15/19.


import Foundation
import UIKit


class ImageLoaderURL: UIImageView {
    private let imageCache = NSCache<NSString, UIImage>()

    var imageUrlString: String?
    
    func loadImageUsingUrlString(_ urlString: String) {
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                //Just to check if the image URL string is equal to urlString parameter, because could exist the case where if I'm scrolling to fast there is a risk of loading the wrong image
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                self.imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
            
        }).resume()
    }
    
}

