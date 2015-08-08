//
//  ArticleDetailTableViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/08/03.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArticleDetailTableViewController: UITableViewController {
    
    var articleJson : JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // このviewで使えるnibを読み込む
        var nib1:UINib = UINib(nibName: "ArticleTitleCustomCell", bundle: nil)
        self.tableView.registerNib(nib1, forCellReuseIdentifier: "titleCell")
        
        var nib2:UINib = UINib(nibName: "ArticleUserCustomCell", bundle: nil)
        self.tableView.registerNib(nib2, forCellReuseIdentifier: "userCell")
        
        var nib3:UINib = UINib(nibName: "ArticleDetailCustomCell", bundle: nil)
        self.tableView.registerNib(nib3, forCellReuseIdentifier: "detailCell")

        
        // セルの高さを動的に変化させるための設定
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        self.tableView.separatorColor = UIColor.clearColor() // tableViewの下線を消す
        self.tableView.tableFooterView = UIView()
        
        // セルの選択を禁止する
        self.tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resgources that can be recreated.
    }


//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var row = indexPath.row
        
        
        switch row {
            case 0:
                var cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as! ArticleTitleCustomCell
                cell.categoryLabel.text = self.articleJson["category"].stringValue
                cell.titleLabel.text = self.articleJson["title"].stringValue
                cell.pageViewsLabel.text = self.articleJson["pageviews"].stringValue + "view"
                cell.likesLabel.text = self.articleJson["likes"].stringValue + "へぇ"
                cell.layoutIfNeeded()
                return cell
            case 1:
                var cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! ArticleUserCustomCell
                cell.userNameLabel.text = self.articleJson["userName"].stringValue
                cell.userImageView.image = UIImage(named: "black.jpg")
                cell.layoutIfNeeded()
                return cell
            case 2:
                var cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! ArticleDetailCustomCell
                cell.detailLabel.text = self.articleJson["detail"].stringValue
                cell.layoutIfNeeded()
                return cell
            default:
                var cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! ArticleDetailCustomCell
                return cell
        }
        
//        if(row == 0){
//            var cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as! ArticleTitleCustomCell
//            cell.categoryLabel.text = self.articleJson["category"].stringValue
//            cell.titleLabel.text = self.articleJson["title"].stringValue
//            cell.pageViewsLabel.text = self.articleJson["pageviews"].stringValue + "view"
//            cell.likesLabel.text = self.articleJson["likes"].stringValue + "へぇ"
//            cell.layoutIfNeeded()
//            return cell
//        }else if(row == 1) {
//            var cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! ArticleUserCustomCell
//            var userId = self.articleJson["userId"].stringValue
//            
//            var myURL = NSURL(string: "http://nakashi100.main.jp/zatsugaku_platform/app/webroot/upload/users/\(userId)/user\(userId)_mini.jpg")
//            var myData = NSData(contentsOfURL: myURL!)
//            if (myData != nil){
//                var myImage = UIImage(data: myData!)
//                cell.userImageView.image = myImage
//            } else {
//                cell.userImageView.image = UIImage(named: "black.jpg")
//            }
//            cell.userNameLabel.text = self.articleJson["userName"].stringValue
//            cell.layoutIfNeeded()
//            return cell
//        }else {
//            var cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! ArticleDetailCustomCell
//            cell.detailLabel.text = self.articleJson["detail"].stringValue
//            cell.layoutIfNeeded()
//            return cell
//        }
    }
}