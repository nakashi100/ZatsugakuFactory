//
//  ArticleDetailViewController.swift
//  
//
//  Created by Tomohide Nakashima on 2015/08/01.
//
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pageViewsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var testView: UITextView!

    
    var articleTitle: String?
    var pageViews: String?
    var likes: String?
    var userName: String?
    var detail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.articleTitle!
        self.pageViewsLabel.text = self.pageViews!
        self.likesLabel.text = self.likes!
        self.userNameLabel.text = self.userName!
        self.detailLabel.text = self.detail!
        self.testView.text = self.detail!
        
        // 高さを0にする
        
        // 行数無制限
        self.detailLabel.numberOfLines = 0
        // サイズを自動調整
        self.detailLabel.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
