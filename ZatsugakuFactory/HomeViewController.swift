//
//  HomeViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/29.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "雑学ファクトリー"
        createPageMenu()
    }

    
    // PageMenuを作成するメソッド
    func createPageMenu() {
        var categoryArray : Array = ["ALL", "エンタメ", "生活・健康", "歴史・文化", "生物・自然", "科学・技術", "スポーツ・趣味", "ビジネス・経済", "その他雑学"]
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []

        for i in 0...(categoryArray.count-1) {
            var zatsugakuTableVC : ZatsugakuTableViewController = ZatsugakuTableViewController(nibName: "ZatsugakuTableViewController", bundle: nil)
            // var zatsugakuTableVC = ZatsugakuTableViewController()
            zatsugakuTableVC.parentNavigationController = self.navigationController
            zatsugakuTableVC.title = categoryArray[i]
            zatsugakuTableVC.categoryId = i
            controllerArray.append(zatsugakuTableVC)
        }

        
        // Customize menu (Optional)
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 60.0, self.view.frame.width, self.view.frame.height - 60.0), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
