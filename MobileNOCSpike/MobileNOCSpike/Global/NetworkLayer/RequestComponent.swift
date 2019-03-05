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
        case authorization
        case contentType
    }
    
    class func headerComponent(_ component: [Component]) -> [String: String]{
        var header = [String: String]()
        let user = "admin@boot.com"
        let password = "admin"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        print("credentialData", credentialData)
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        print("base64Credentials", base64Credentials)
        for singleComponent in component{
            switch singleComponent{
            case .authorization:
                header["Authorization"] = "Basic \(base64Credentials)"
            case .contentType:
                header["Content-Type"] = "application/json"
            }
        }
        
        return header
    }
    
    
}
