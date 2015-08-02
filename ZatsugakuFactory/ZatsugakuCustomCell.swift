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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.categoryLabel.backgroundColor = UIColor(red: 211.0/255.0, green: 163.0/255.0, blue: 81.0/255.0, alpha: 1.0)
//        self.titleLabel.font = UIFont(name: "Helvetica-bold", size: 14)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(category: String, title: String, pageViews: String, likes: String, userName: String) {
        self.categoryLabel.text = category
        self.titleLabel.text = title
        self.pageViewsLabel.text = pageViews
        self.likesLabel.text = likes
        self.userNameLabel.text = userName
    }
    
    
    
}
