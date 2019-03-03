//
//  TextField.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/2/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit


@IBDesignable
open class CustomTextField: UITextField {
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(CGRect(x: bounds.origin.x + leftPadding + imageWidth , y: bounds.origin.y, width: bounds.width + rightWidth - rightPadding - imageWidth, height: bounds.height), padding)
    }
    
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(CGRect(x: bounds.origin.x + leftPadding + imageWidth , y: bounds.origin.y, width: bounds.width + rightWidth - rightPadding - imageWidth, height: bounds.height), padding)
    }
    
    // Provides left padding for images
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        layer.cornerRadius = radius
        return textRect
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        layer.cornerRadius = radius
        return textRect
    }
    
    
    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var imageWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var imageHeight: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImageHeight: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImageWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var radius: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight))
            imageView.image = image
            imageView.tintColor = color
            leftViewMode = .always
            leftView = imageView
            
        } else {
            leftViewMode = .never
            leftView = nil
        }
        
        if let image = rightImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: rightImageWidth, height: rightImageHeight))
            imageView.image = image
            imageView.tintColor = color
            rightViewMode = .always
            rightView = imageView
        } else {
            rightViewMode = .never
            rightView = nil
        }
    }
}

class NoPasteUITextField: CustomTextField{
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) { return false }
        return super.canPerformAction(action, withSender: sender)
    }
}



