//
//  RequestComponent.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation

class RequestComponent{
    
    enum Component {
        case lang
        case authorization
        case contentType
    }
    
    class func headerComponent(_ component: [Component]) -> [String: String]{
        var header = [String: String]()
        
        for singleComponent in component{
            switch singleComponent{
            case .lang:
                header["lang"] = "en"
            case .authorization:
                header["Authorization"] = "Bearer " + ""
            case .contentType:
                header["Content-Type"] = "application/json"
            }
        }
        
        return header
    }
    
    
}
