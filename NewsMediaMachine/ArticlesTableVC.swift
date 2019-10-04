//
//  ArticlesVC.swift
//  NewsMediaMachine
//
//  Created by Nazar Petruk on 03/10/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesTableVC: UITableViewController {
    
    //MARK: Vars and Const
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? newsCell {
            let article = articles[indexPath.row]
            cell.cellTitle.text = article.title
            cell.cellNewsCategory.text = article.category.rawValue
            let imageURL = URL(string: article.urlToImg)
            cell.cellImg.kf.setImage(with: imageURL)
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "goToWebView", sender: article)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebView"{
            if let article = sender as? Article {
                if let webVC = segue.destination as? ArticleWebVC{
                    webVC.article = article
                }
            }
        }
    }
    
    func getArticles() {
        NewsCreator().getArticles { (articles) in
                   self.articles = articles
                   self.tableView.reloadData()
               }
    }
    
    @IBAction func reloadTapped(_ sender: Any) {
        getArticles()
    }
    
}

class newsCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellNewsCategory: UILabel!
    @IBOutlet weak var emptyView: UIView!
    
}
