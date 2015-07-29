//
//  ZatsugakuListViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/29.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class ZatsugakuListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    override func viewWillAppear(animated: Bool) {
//        var title = self.title
//        println(title)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // TableViewの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    // セルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("zatsugakuCell") as! ZatsugakuTableViewCell
        
        cell.setData(indexPath, title: self.title!)

        return cell
    }
    
    // セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110.0
    }
    
    // セルが選択された場合
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    }
    

    
    



}
