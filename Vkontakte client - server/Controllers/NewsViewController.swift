//
//  NewsViewController.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 04.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    var postNews: VKNews?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.loadPostNews(completion: { [weak self] news in
            self?.postNews = news
            self?.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postNews?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostNewsCell", for: indexPath) as! PostNewsCell
            
            let sourceId = postNews?.items[indexPath.row].sourceId
            let groupsNews = postNews?.groups.filter { $0.groupId == sourceId }.first
            let profilesNews = postNews?.profiles.filter { $0.profilesId == sourceId }.first
            
            //let owner = groupsNews == nil ? profilesNews : groupsNews
            
            //cell.configure(with: postNews?.items[indexPath.row], owner: owner)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoNewsCell", for: indexPath) as! PhotoNewsCell
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
