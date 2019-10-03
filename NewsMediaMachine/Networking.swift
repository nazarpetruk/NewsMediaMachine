//
//  NewsCreator.swift
//  NewsMediaMachine
//
//  Created by Nazar Petruk on 03/10/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation
import Alamofire


class NewsCreator {
    
    func getArticles (){
        Alamofire.request("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=deec1dac677344dfa61ae61c4c103975").responseJSON { (response) in
            print(response)
        }
    }
}
