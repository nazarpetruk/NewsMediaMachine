//
//  ArticleWebVC.swift
//  NewsMediaMachine
//
//  Created by Nazar Petruk on 03/10/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var article = Article()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: article.articleUrl) {
            webView.load(URLRequest(url: url))
        }
    }
}
