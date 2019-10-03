//
//  ArticlesVC.swift
//  NewsMediaMachine
//
//  Created by Nazar Petruk on 03/10/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class ArticlesTableVC: UITableViewController {
    
    //MARK: Vars and Const
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsCreator().getArticles { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
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
            cell.cellNewsCategory.text = article.category
            
            return cell
        }
        return UITableViewCell()
    }
    
}

class newsCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellNewsCategory: UILabel!
    
}
