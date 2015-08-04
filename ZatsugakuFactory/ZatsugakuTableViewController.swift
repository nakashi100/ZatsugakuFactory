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
    let refreshCL = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // このviewで使えるnibを読み込む
        var nib:UINib = UINib(nibName: "ZatsugakuCustomCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "myCell")
        
        self.tableView.separatorColor = UIColor.clearColor() // tableViewの下線を消す
        self.tableView.backgroundColor = UIColor(red: 241.0/255.0, green: 240.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        
        getArticlesJson()
        refresh()
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
        var articleDetailTVC : ArticleDetailTableViewController = ArticleDetailTableViewController(nibName: "ArticleDetailTableViewController", bundle: nil)
        
        articleDetailTVC.articleJson = self.articlesJson[row]
        
        self.parentNavigationController!.pushViewController(articleDetailTVC, animated: true)
        
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
    
    // 引っ張ってロードするメソッド
    func refresh() {
        self.refreshCL.attributedTitle = NSAttributedString(string: "update")
        self.refreshCL.addTarget(self, action: "refreshStart", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(self.refreshCL)
    }
    
    func refreshStart() {
        getArticlesJson()
        self.refreshCL.endRefreshing()
    }
    
}
