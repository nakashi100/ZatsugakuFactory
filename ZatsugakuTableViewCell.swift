//
//  ZatsugakuTableViewCell.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/29.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class ZatsugakuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(indexPath: NSIndexPath, title: String) {
        var row = indexPath.row
        
        titleLabel.text = "\(title)の\(row)番目の雑学"
    }
}
