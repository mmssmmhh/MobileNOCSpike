//
//  Media.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit

struct Media {
    
    let key: String
    let fileName: String
    let data: Data
    let mimeType: String
    
    init?(withData data: Data, forKey key: String, mimeType: String, fileName: String) {
        self.data = data
        self.key = key
        self.mimeType = mimeType
        self.fileName = fileName
    }
}

