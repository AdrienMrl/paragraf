//
//  ParagraphTableViewCell.swift
//  paragraf
//
//  Created by Adrien Morel on 15/11/2016.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit

class ParagraphTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var authorProfileView: UIView!
    
    public func setParagraph(_ text: String) {
        
        let style = NSMutableParagraphStyle()
        
        style.lineSpacing = 8
        style.firstLineHeadIndent = 16
        style.alignment = .justified
        
        
        let attributes = [NSParagraphStyleAttributeName: style]
        textView.attributedText = NSAttributedString(string: text, attributes:attributes)
        
        textView.font = UIFont(name: "Georgia", size: 18)
        
    }
    
    public func setProfile(/* pic: UIImage */) {
        
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.masksToBounds = true
    }
    
    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        
        setProfile()
        
        
        let rec = authorProfileView.frame
//        rec = rec.applying(CGAffineTransform(translationX: 0, y: -40))
        
        let imgRect = UIBezierPath(rect: rec)
        textView.textContainer.exclusionPaths = [imgRect]
    }
}
