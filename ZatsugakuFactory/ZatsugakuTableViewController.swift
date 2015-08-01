//
//  ZatsugakuTableViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/31.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ZatsugakuTableViewController: UITableViewController {
    
    var parentNavigationController : UINavigationController?
    var categoryId :Int?
    var articlesJson : JSON = [] {
        didSet{
            self.tableView.reloadData()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // このviewで使えるnibを読み込む
        var nib:UINib = UINib(nibName: "ZatsugakuCustomCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "myCell")
        
        getArticlesJson()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // セルの行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesJson.count
    }

    // セルの中身
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var row = indexPath.row
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! ZatsugakuCustomCell
                
        var category = self.articlesJson[row]["category"].stringValue
        var title = self.articlesJson[row]["title"].stringValue
        var pageViews = self.articlesJson[row]["pageviews"].stringValue
        var likes = self.articlesJson[row]["likes"].stringValue
        var userName = self.articlesJson[row]["userName"].stringValue
        
        cell.setData(category, title: title, pageViews: pageViews, likes: likes, userName: userName)
 
        return cell
    }
    
    // セルの高さ
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95.0
    }
    
    // セルが選択されたとき
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var row = indexPath.row
        var articleDetailVC : ArticleDetailViewController = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: nil)
        
        articleDetailVC.title = self.articlesJson[row]["title"].stringValue
        articleDetailVC.articleTitle = self.articlesJson[row]["title"].stringValue
        articleDetailVC.pageViews = self.articlesJson[row]["pageviews"].stringValue
        articleDetailVC.likes = self.articlesJson[row]["likes"].stringValue
        articleDetailVC.userName = self.articlesJson[row]["userName"].stringValue
        articleDetailVC.detail = self.articlesJson[row]["detail"].stringValue
        
        self.parentNavigationController!.pushViewController(articleDetailVC, animated: true)
    }
    
    
    // データをjson形式で取得するメソッド
    func getArticlesJson() {
        Alamofire.request(.GET, "http://192.168.33.13/zatsugaku_platform/Articles/json_data/\(self.categoryId!)") // あとで本番環境のURLに変更する
            .responseJSON { (request, response, json, error) in
                
                if(error != nil) {
                    println("失敗しました")
                } else {
                    self.articlesJson = JSON(json!)
                }
        }
    }
    
}
