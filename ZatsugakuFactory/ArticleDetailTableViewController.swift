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
        var nib:UINib = UINib(nibName: "ArticleDetailCustomCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "detailCell")
        
        
        // セルの高さを動的に変化させるための設定
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! ArticleDetailCustomCell
        var row = indexPath.row
        
        cell.titleLabel.text = testArray[row]
        cell.detailLabel.text = testArray[row]
        cell.layoutIfNeeded()
        
        return cell
    }
    
    
}
