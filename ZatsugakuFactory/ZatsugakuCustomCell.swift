//
//  ZatsugakuCustomCell.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/31.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class ZatsugakuCustomCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pageViewsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // UIに角丸を適用する
        self.categoryLabel.layer.cornerRadius = 3
        self.categoryLabel.layer.masksToBounds = true
        
        self.cellView.layer.cornerRadius = 5
        self.cellView.layer.masksToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(category: String, title: String, pageViews: String, likes: String, userName: String) {
        self.categoryLabel.text = category
        self.titleLabel.text = title
        self.pageViewsLabel.text = pageViews + "view"
        self.likesLabel.text = likes + "へぇ"
        self.userNameLabel.text = userName
    }
    
    
    
}
