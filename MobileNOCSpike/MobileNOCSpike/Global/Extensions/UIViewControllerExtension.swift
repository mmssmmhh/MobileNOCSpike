//
//  UIViewControllerExtension.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/2/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func alertUser(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: completion)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

