//
//  NewsCreator.swift
//  NewsMediaMachine
//
//  Created by Nazar Petruk on 03/10/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation
import Alamofire
import DocumentClassifier


class NewsCreator {
    
    func getArticles (returnArticles : @escaping ([Article]) -> Void){
        Alamofire.request("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=deec1dac677344dfa61ae61c4c103975").responseJSON { (response) in
            if let json = response.result.value as? [String : Any] {
                if let jsonArticles = json["articles"] as? [[String : Any]] {
                    var articles = [Article]()
                    for jsonArticle in jsonArticles {
                        guard let title = jsonArticle["title"] as? String,
                            let urlToImg = jsonArticle["urlToImage"] as? String,
                            let articleUrl = jsonArticle["url"] as? String,
                            let description = jsonArticle["description"] as? String else { continue }
                        
                        let article = Article()
                        article.title = title
                        article.urlToImg = urlToImg
                        article.articleUrl = articleUrl
                        article.description = description
                        
                        guard let classification = DocumentClassifier().classify(title + description) else { return }
                        article.description = classification.prediction.category.rawValue
                        
                        articles.append(article)
                    }
                    returnArticles(articles)
                }
            }
        }
    }
}

class Article {
    
    var title = ""
    var urlToImg = ""
    var articleUrl = ""
    var description = ""
    var category = ""
}
