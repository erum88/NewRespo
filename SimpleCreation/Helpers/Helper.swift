//
//  Helper.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import UIKit
import SDWebImage

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
}


extension UIImageView {
    
    func setImageWith(_ url: String?, placeholder: UIImage? = nil) {
        
        guard let url = url, let imageURL = URL(string: url) else {
            self.image = placeholder
            return
        }
        
        let complated: SDExternalCompletionBlock = { (image, error, cacheType, imageURL) -> Void in
            //guard let url = imageURL?.absoluteString, let img = image else { return }
            //SKCache.sharedCache.setImage(img, forKey: url)
        }
        self.sd_setImage(with: imageURL, placeholderImage: placeholder, completed: complated)
    }
   
    func setImageWith(_ url: URL?, placeholder: UIImage? = nil) {
        
        guard let imageURL = url else {
            self.image = placeholder
            return
        }
        
        let complated: SDExternalCompletionBlock = { (image, error, cacheType, imageURL) -> Void in
            //guard let url = imageURL?.absoluteString, let img = image else { return }
            //SKCache.sharedCache.setImage(img, forKey: url)
        }
        self.sd_setImage(with: imageURL, placeholderImage: placeholder, completed: complated)
    }
}


extension UIView {

    func dropShadow() {
       layer.shadowRadius = 10
       layer.shadowOffset = .zero
       layer.shadowOpacity = 0.5
       layer.shadowColor = UIColor.gray.cgColor
       layer.shadowOffset = CGSize(width: 0, height: 10)
       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
    }
}
