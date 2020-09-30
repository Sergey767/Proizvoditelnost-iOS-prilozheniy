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
        
        networkService.loadPostNews(token: Singleton.instance.token, completion: { [weak self] news, error in
            guard error == nil else {
                print("Some error in loading data")
                return
            }
            self?.postNews = news
            self?.tableView.reloadData()
        })
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postNews?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostNewsCell", for: indexPath) as? PostNewsCell
            
            guard let postCell = cell, let postNews = postNews else {
                return UITableViewCell()
            }
            
            let sourceID = postNews.items[indexPath.row].sourceId
            let ownerGroupNews = postNews.groups.filter { $0.groupId == -sourceID }.first
            let ownerProfilesNews = postNews.profiles.filter { $0.profilesId == sourceID }.first
            
            let ownerName = ownerProfilesNews == nil ? ownerGroupNews?.nameGroup :
                ownerProfilesNews!.firstName + " " + ownerProfilesNews!.lastName
            let ownerAvatarImage = ownerProfilesNews == nil ? ownerGroupNews?.photo : ownerProfilesNews?.photo

            postCell.imageAvatarNews.kf.setImage(with: URL(string: (ownerAvatarImage)!))
            postCell.imageAvatarNews.layer.cornerRadius = postCell.imageAvatarNews.frame.size.width / 2
            postCell.imageAvatarNews.clipsToBounds = true

            postCell.userNameNews.text = ownerName
            
            postCell.configure(with: postNews.items[indexPath.row], ownerGroupNews: ownerGroupNews, ownerProfilesNews: ownerProfilesNews)
                return postCell
            
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoNewsCell", for: indexPath) as? PhotoNewsCell
            
            guard let photoCell = cell, let postNews = postNews else {
                return UITableViewCell() }
            
            let sourceID = postNews.items[indexPath.row].sourceId
            let ownerGroupNews = postNews.groups.filter { $0.groupId == -sourceID }.first
            let ownerProfilesNews = postNews.profiles.filter { $0.profilesId == sourceID }.first
            
            let ownerName = ownerProfilesNews == nil ? ownerGroupNews?.nameGroup : ownerProfilesNews!.firstName + " " + ownerProfilesNews!.lastName
            
            let ownerAvatarImage = ownerProfilesNews == nil ? ownerGroupNews?.photo : ownerProfilesNews?.photo
            
            photoCell.imageAvatarNews.kf.setImage(with: URL(string: ownerAvatarImage!))
            photoCell.imageAvatarNews.layer.cornerRadius = photoCell.imageAvatarNews.frame.size.width / 2
            photoCell.imageAvatarNews.clipsToBounds = true

            photoCell.userNameNews.text = ownerName
            
            photoCell.configure(with: postNews.items[indexPath.row], ownerGroupNews: ownerGroupNews, ownerProfilesNews: ownerProfilesNews)
            return photoCell
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
