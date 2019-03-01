//
//  RequestManager.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    func request<T: Decodable>(fromUrl url: String, byMethod method: HTTPMethod, withParameters parameters: [String:Any]?
        , andHeaders headers: [String: String]?, completion: @escaping (_ error: String?, T?) -> ()) {
        print("✊ \(method) With URL:  \(url)")
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                
                let code  = response.response?.statusCode
                print(response)
                switch response.result{
                case .success(_):
                    
                    if code == 200 || code == 201{
                        // 200 success in general , 201 success for signUp
                        self.handleSuccess(response: response, completion: completion)
                        
                    }else if code == 400 {
                        //invalid url: your sent a request that this server could not understand.
                        self.handleError(response: response, completion: completion)
                        
                    }else if code == 401 {
                        //Unauthorized error: the page you were trying to access cannot be loaded until you first log in with a valid user ID and password
                        
                    }else if code == 426 {
                        self.handleUpgradeRequired(response: response, completion: completion)
                        
                    }else if code == 404{
                        self.handleErrors(response: response, completion: completion)
                    }else{
                        completion("error occured with code: \(code ?? -1), please try again later", nil)
                    }
                    
                case .failure(let error):
                    print("😡 Failure \(error.localizedDescription)")
                    completion(error.localizedDescription, nil)
                }
        }
    }
    
    private func handleSuccess<T: Decodable>(response: DataResponse<Any>, completion: @escaping (_ error: String?, T?) -> ()) {
        
        guard let _data = response.data else {
            completion("error occured while handling data, please try again later",nil)
            return
        }
        
        do{
            
            let data = try JSONDecoder().decode(T.self, from: _data)
            print(data)
            completion(nil, data)
            
        } catch{
            print("----------------")
            print(error)
            completion("error in decoding, please try again later",nil)
        }
    }
    
    private func handleUpgradeRequired<T: Decodable>(response: DataResponse<Any>, completion: @escaping (_ error: String?, T?) -> ()) {
        completion("Upgrade Required", nil)
    }
    
    private func handleError<T: Decodable>(response: DataResponse<Any>, completion: @escaping (_ error: String?, T?) -> ()) {
        // error occured is here
        if let _ = response.data{
            completion("", nil)
        }
    }
    
    private func handleErrors<T: Decodable>(response: DataResponse<Any>, completion: @escaping (_ error: String?, T?) -> ()) {
        // errors occured is here
        guard let _ = response.data else {
            completion("error occured while handling data, please try again later",nil)
            return
        }
        
//        do{
//            
//            let data = try JSONDecoder().decode(DefaultResponse.self, from: _data)
//            
//            var theError = ""
//            for error in data.errors{
//                theError += "\(error.value) \n"
//            }
//            
//            completion(theError, nil)
//        } catch{
//            print("----------------")
//            print(error)
//            completion("error in decoding, please try again later",nil)
//        }
    }
}
