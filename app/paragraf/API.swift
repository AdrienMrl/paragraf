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


class API {
    
    let server: String
    let port: Int
    
    init(server: String, port: Int) {
        self.server = server
        self.port = port
    }

}
