//
//  API.swift
//  paragraf
//
//  Created by gwendal lasson on 24/11/16.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit
import SwiftyJSON


class API {
    
    let serverURL: String
    let port: Int
    var API_token: String? = nil
    
    
    init(serverURL: String, port: Int) {
        self.serverURL = serverURL
        self.port = port
        
    }
    
    func retrieveToken() -> Bool {
        let parameters: Parameters = ["token" : FBSDKAccessToken.current().tokenString]
        Alamofire.request(serverURL,method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Token granted")
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }

        return API_token != nil
    }
}
