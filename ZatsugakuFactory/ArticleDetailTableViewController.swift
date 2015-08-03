//
//  ArticleDetailTableViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/08/03.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class ArticleDetailTableViewController: UITableViewController {
    
    var testArray = [
        "私わたくしはその人を常に先生と呼んでいた。だからここでもただ先生と書くだけで本名は打ち明けない。",
        "この書の世に出づるにいたりたるは、函館にある秦慶治氏、及び信濃にある神津猛氏のたまものなり。労作終るの日にあたりて、このものがたりを二人の恩人のまへにさゝぐ。",
        "散文に二種あると考へてゐるが、一を小説、他を作文とかりに言つておく。",
        "機敏な晩熟児といふべき此の男が、現に存するのだから僕は機敏な晩熟児が如何にして存るママかその様を語らうと思ふ。"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // このviewで使えるnibを読み込む
        var nib1:UINib = UINib(nibName: "ArticleTitleCustomCell", bundle: nil)
        self.tableView.registerNib(nib1, forCellReuseIdentifier: "titleCell")
        
        var nib2:UINib = UINib(nibName: "ArticleDetailCustomCell", bundle: nil)
        self.tableView.registerNib(nib2, forCellReuseIdentifier: "detailCell")
        
        // セルの高さを動的に変化させるための設定
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
        
        if(row == 0){
            
            var cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as! ArticleTitleCustomCell
            cell.titleLabel.text = testArray[row]
            cell.layoutIfNeeded()
            return cell
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! ArticleDetailCustomCell
            cell.detailLabel.text = testArray[row]
            cell.layoutIfNeeded()
            return cell
        }
        
    }
}