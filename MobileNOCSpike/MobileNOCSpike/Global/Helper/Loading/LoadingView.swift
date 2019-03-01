//
//  LoadingView.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var loadingNamedLabel: UILabel!
    
    var loadingName: String = ""{
        didSet{
            self.loadingNamedLabel.text = loadingName
        }
    }
    
    override func draw(_ rect: CGRect) {
        mainView.layer.cornerRadius = 16
    }
    
    
}
