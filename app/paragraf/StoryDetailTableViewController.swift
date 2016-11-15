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

        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell: UITableViewCell!
        
        if (indexPath.row == 0) {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)// as! HeaderStoryDetailTableViewCell
            
        } else {
            
            let cellParagraph = tableView.dequeueReusableCell(withIdentifier: "paragraphCell", for: indexPath) as! ParagraphTableViewCell
            
            
            let text = indexPath.row == 1 ? "Hi guys. I'm matt\nMatt" : "Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. Bite bien dure. "
            
            cellParagraph.setParagraph(text)
            
            cell = cellParagraph
        }
        
        return cell
    }
    

}
