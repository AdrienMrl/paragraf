//
//  AuthViewController.swift
//  
//
//  Created by gwendal lasson on 15/11/16.
//
//

import UIKit
import FBSDKLoginKit

class AuthViewController: UIViewController, FBSDKLoginButtonDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let readPermissions = ["email", "public_profile"]
            
            let loginButton = FBSDKLoginButton()
            loginButton.readPermissions = readPermissions
            
            view.addSubview(loginButton)
            loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
            
            loginButton.delegate = self
        }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("")
        print(FBSDKAccessToken.current().tokenString)
        print("")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err ?? "Unknown error")
                return
            }
            print(result ?? "Nothing")
        }
    }

}
