//
//  StoryDetailTableViewController.swift
//  paragraf
//
//  Created by Adrien Morel on 15/11/2016.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit

class StoryDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    @IBAction func publish(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Publish", message: "Are you sure ?", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default)
        {
            (UIAlertAction) -> Void in
            
            print("commit")
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }

    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    func genHeader(for indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
    }
    
    func genParagraph(for indexPath: IndexPath) -> UITableViewCell {
        let cellParagraph = tableView.dequeueReusableCell(withIdentifier: "paragraphCell", for: indexPath) as! ParagraphTableViewCell
        
        let text = indexPath.row == 1 ? "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda." : "Another pargrap Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text "
        
        cellParagraph.setParagraph(text)
        
        return cellParagraph
    }
    
    func genPrompt(for indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "prompt", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            return genHeader(for: indexPath)
        } else if (indexPath.row == 4) {
            return genPrompt(for: indexPath)
        } else {
            return genParagraph(for: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("something seguing !")
    }
    
}
