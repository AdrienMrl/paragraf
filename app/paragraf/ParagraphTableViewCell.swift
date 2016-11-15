//
//  ParagraphTableViewCell.swift
//  paragraf
//
//  Created by Adrien Morel on 15/11/2016.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit

class ParagraphTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    public func setParagraph(_ text: String) {
        textView.text = text
    }
}
