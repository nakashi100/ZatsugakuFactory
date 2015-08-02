//
//  AppDelegate.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/07/29.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
    

        // ナビゲーションバーの下線を消すために空のUIImageを入れる
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        // ステータスバーをカスタマイズする
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor = UIColor(red: 85.0/255.0, green: 71.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        self.window!.rootViewController!.view.addSubview(view)
        
        // ステータスバーの文字色を変更(info.plistで”View controller-based status bar”をNOにセットする必要あり)
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        
        // ナビゲーションバーの色
         UINavigationBar.appearance().barTintColor = UIColor(red: 85.0/255.0, green: 71.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        // ナビゲーションバーの背景色
        UINavigationBar.appearance().backgroundColor = UIColor(red: 85.0/255.0, green: 71.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        // ナビゲーションバーボタンのベースの色（設定アイコンの色など）
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        // ナビゲーションバーのタイトル文字色
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        

        // TabBarItemのアイコンの色
        UITabBar.appearance().tintColor = UIColor(red: 85.0/255.0, green: 71.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        
        
        // フォントを一括変更
//        UILabel.appearance().font = UIFont(name: "Helvetica", size: 14.0)
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

