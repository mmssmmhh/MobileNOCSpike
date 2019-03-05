//
//  Router.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation
import UIKit

class Router {
    
    private func go(withVC vc: UIViewController){
        let window = Initializer.getWindow()
        window.makeKeyAndVisible()
        window.rootViewController = vc
    }
    
    private func go(withNavigationVC vc: UINavigationController){
        let window = Initializer.getWindow()
        window.makeKeyAndVisible()
        window.rootViewController = vc
    }
    
    func toHomeVC(){
        let id = "HomeVC"
        let nextVC = Initializer.createViewController(storyBoard: .HomeSB, andId: id) as! HomeVC
        go(withVC: nextVC)
    }
    
}
