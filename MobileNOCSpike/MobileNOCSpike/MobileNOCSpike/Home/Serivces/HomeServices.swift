//
//  HomeServices.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation
import Alamofire



class HomeServices{

    func getHomeData(completion: @escaping (_ error: String?, _ data: HomeResponse?) -> ()){
        
        let url = URLs.base + URLs.Home
        
        let headers = RequestComponent.headerComponent([.authorization, .contentType])
        RequestManager().request(fromUrl: url, byMethod: .get, withParameters: nil, andHeaders: headers) { (error, data: HomeResponse?) in
            
            if let error = error {
                completion(error, nil)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            completion(nil, data)
        }
    }
}
