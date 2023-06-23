//
//  Image+Extensions.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

public extension UIImageView {
    func loadUrlImage(from urlStr: String) {
        if let image = imageCache.object(forKey: urlStr as NSString) as? UIImage {
            self.image = image
            return
        }

        guard let url = URL(string: urlStr) else {
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlStr as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
