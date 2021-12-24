//
//  APIManager.swift
//  GET People and Films
//
//  Created by admin on 23/12/2021.
//

import Foundation

class APIManager {
    class func getApiResponse( urlPath:String , completionHandler : @escaping (Data? , Error? )-> Void){
        
        let urlSession = URLSession.shared
        guard let url = URL.init(string: urlPath) else {return}
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error != nil {
                print("\(String(describing : error?.localizedDescription))")
                completionHandler(nil,error)
            }else{
                completionHandler(data,nil)
            }
        }
        
        task.resume()
        
    }
}
