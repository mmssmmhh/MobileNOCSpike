//
//  UIColorExtension.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/2/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//


import UIKit

extension UIColor{
    static func Lightblue() -> UIColor{
        return UIColor(red: 228/255, green: 246/255, blue: 255/255, alpha: 1)
    }
    
    static func LightGray() -> UIColor{
        return UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
}
