//
//  AboutAppViewController.swift
//  ZatsugakuFactory
//
//  Created by Tomohide Nakashima on 2015/08/05.
//  Copyright (c) 2015年 Tomohide Nakahsima. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var aboutLabel: UITextView!
    
    @IBOutlet weak var urlTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let text = "ダウンロードありがとうございます。\n\nこのアプリはユーザー同士で雑学をシェアするWebサービス「雑学ファクトリー(http://zatsugaku-factory.xyz)」の閲覧専用アプリです。\n\n雑学の「投稿」「検索」「お気に入り登録」などはWeb版にアクセスしていただき、会員登録をしてご利用ください。\n\nなお本ver1.0では雑学の「閲覧」のみ可能ですが、今後のアップデートにより「投稿」「検索」「お気に入り登録」などの機能を追加予定です。\n\n雑学ファクトリーをお楽しみください。"
//        
//        self.aboutLabel.text = text
        
        
        self.urlTextView.dataDetectorTypes = .Link  // リンクの検知を有効にする
        // html ダブルクォーテーションは\でエスケープする
        let htmlText = "<a href=\"http://zatsugaku-factory.xyz\">Web版「雑学ファクトリー」</a>"
        
        // UTF8でエンコード
        let htmlData = htmlText.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:true)!
        
        // ドキュメントタイプにHTMLを指定する
        let options:[NSObject:AnyObject] = [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding]
        
        // AttributedStringの作成
        let attributedText = NSAttributedString(data: htmlData, options: options, documentAttributes: nil, error: nil)
        
        // 作成したAttributedStringをtextViewにセット
        self.urlTextView.attributedText = attributedText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
