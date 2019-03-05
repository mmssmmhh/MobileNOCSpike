//
//  UIImageViewExtension.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/3/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    func load(name: String) {
        if let image = UIImage(named: name) {
                self.image = image
        }
    }
}
