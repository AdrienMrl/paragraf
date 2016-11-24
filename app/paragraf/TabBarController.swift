//
//  TabBarController.swift
//  paragraf
//
//  Created by gwendal lasson on 24/11/16.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = API(serverURL: "http://192.168.1.111", port: 3000)
        api.retrieveToken(logToFacebook: presentFacebookLogin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func presentFacebookLogin() {
        performSegue(withIdentifier: "facebookLogin", sender: nil)
    }
    
    @IBAction func unwindToTBC(segue: UIStoryboardSegue) {}

}
