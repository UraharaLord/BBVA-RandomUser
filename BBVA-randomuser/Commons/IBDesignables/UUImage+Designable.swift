//
//  UUImage+Designable.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import UIKit

@IBDesignable
class ImageDesignable: UIImageView {
    
    // MARK: - @IBInspectable functions
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var backGroundColor: UIColor = UIColor.clear {
        didSet {
            self.layer.backgroundColor = backGroundColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
