//
//  StoryDetailHeaderTableViewCell.swift
//  paragraf
//
//  Created by Adrien Morel on 15/11/2016.
//  Copyright © 2016 Adrien Morel. All rights reserved.
//

import UIKit

class StoryDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var storyName: UILabel!
    @IBOutlet weak var storyPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        addGradients()
    }
    
    func addGradients() {
        
        let bottomGradient: CAGradientLayer = CAGradientLayer()
        let    topGradient: CAGradientLayer = CAGradientLayer()
        
        let gradientHeight = frame.height / 1.6
        
        bottomGradient.frame =
            CGRect(x: storyPicture.frame.minX, y: storyPicture.frame.maxY - gradientHeight, width: storyPicture.frame.width, height: gradientHeight)
           topGradient.frame =
            CGRect(x: storyPicture.frame.minX, y: storyPicture.frame.minY, width: storyPicture.frame.width, height: gradientHeight)
        
        bottomGradient.colors = [UIColor.clear, UIColor.black.cgColor]
           topGradient.colors = [UIColor.black.cgColor, UIColor.clear]
        
        bottomGradient.opacity = 0.8
           topGradient.opacity = 0.8
        
        bottomGradient.zPosition = 1
           topGradient.zPosition = 1
        
        self.storyPicture.layer.insertSublayer(bottomGradient, at: 0)
        self.storyPicture.layer.insertSublayer(   topGradient, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
