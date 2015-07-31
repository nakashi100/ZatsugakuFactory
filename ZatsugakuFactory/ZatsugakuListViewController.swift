//
//  ZatsugakuListViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/29.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class ZatsugakuListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    // var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var articlesJson : JSON = []
    var categoryId : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getArticlesJson()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // TableViewの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesJson.count;
    }

    // セルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("zatsugakuCell") as! ZatsugakuTableViewCell
        
        var row = indexPath.row
        var category = self.articlesJson[row]["category"].stringValue
        var title = self.articlesJson[row]["title"].stringValue
        var pageViews = self.articlesJson[row]["pageviews"].stringValue
        var likes = self.articlesJson[row]["likes"].stringValue
        var userName = self.articlesJson[row]["userName"].stringValue

        cell.setData(category, title: title, pageViews: pageViews, likes: likes, userName: userName)
        
        return cell
    }
    
    // セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95.0
    }
    
    // セルが選択された場合
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
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
                self.tableView.reloadData() // TableViewをリロード
        }
    }



}
