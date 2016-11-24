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
        
        let verticalConstraint = NSLayoutConstraint(item: loginButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -30)
        let rightConstraint = NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -30)
        let leftConstraint = NSLayoutConstraint(item: loginButton, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 30)
        let heightContraint = NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([verticalConstraint, leftConstraint, rightConstraint, heightContraint])
        
        loginButton.delegate = self
        print((FBSDKAccessToken.current()?.tokenString) ?? "No token")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print((FBSDKAccessToken.current()?.tokenString) ?? "No token")
        performSegue(withIdentifier: "unwindToTBC", sender: nil)
    }
    
}
