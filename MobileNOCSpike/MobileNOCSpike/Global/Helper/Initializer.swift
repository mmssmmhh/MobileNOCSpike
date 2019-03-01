//
//  Initializer.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit

class Initializer {
    
    class func getStoryBoard(WithName name: StoryBoard)-> UIStoryboard {
        let storyBoard = UIStoryboard(name: name.rawValue, bundle: nil)
        return storyBoard
    }
    
    class func getWindow()->UIWindow{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        return window!
    }
    
    class func createViewController(storyBoard: StoryBoard ,andId id: String)->UIViewController{
        let storboard = getStoryBoard(WithName: storyBoard)
        let vc = storboard.instantiateViewController(withIdentifier: id)
        return vc
    }
    
}

