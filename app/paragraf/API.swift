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
    
    func retrieveToken(logToFacebook: @escaping () -> ()) {
        let facebookToken = FBSDKAccessToken.current().tokenString!
        let parameters: Parameters = ["access_token" : facebookToken]
        Alamofire.request(serverURL + ":" + String(port) + "/token", method: .get, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Token granted")
                let json = JSON(value)
                self.API_token = json["token"].string
            case .failure(let error):
                print(error)
                logToFacebook()
            }
        }

    }
}
