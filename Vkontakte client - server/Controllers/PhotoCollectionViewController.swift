//
//  MyPhotoCollectionViewController.swift
//  Vkontakte
//
//  Created by Серёжа on 29/06/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit
import RealmSwift
import AsyncDisplayKit

class PhotoCollectionViewController: ASDKViewController<ASCollectionNode> {
    let collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
    
    var networkService = NetworkService()
    //private lazy var photos = try? Realm().objects(Photo.self).filter("userId == %@", userId ?? 0)
    var photos = [Photo]()
    private var notificationToken: NotificationToken?
    
    public var userId: Int?
    var friendTitle = ""
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        super.init(node: collectionNode)
        
        self.collectionNode.delegate = self
        self.collectionNode.dataSource = self
        
        self.collectionNode.allowsSelection = true
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let userId = userId {
//            networkService.fetchPhotos(for: userId) { [weak self] photos in
//                try? RealmProvider.save(items: photos)
//            }
//        }
//
        if let userId = userId {
            networkService.fetchPhotos(for: userId) { [weak self] photos in
                self?.photos = photos
                self?.collectionNode.reloadData()
            }
        }

//        notificationToken = photos.observe { [weak self] change in
//            guard let self = self else { return }
//            switch change {
//            case .initial:
//                break
//            case .update:
//                self.collectionNode.reloadData()
//            case .error(let error):
//                self.show(error)
//            }
//        }

        self.title = friendTitle
    }
}

extension PhotoCollectionViewController: ASCollectionDelegate {
    
}

extension PhotoCollectionViewController: ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        guard photos.count > indexPath.row else { return { ASCellNode() } }
        
        let photo = photos[indexPath.row]
        
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = PhotoNode(resource: photo)
            return cellNode
        }
        return cellNodeBlock
    }
}

//class PhotoCollectionViewController: UICollectionViewController {
//    let networkService = NetworkService()
//    private lazy var photos = try? Realm().objects(Photo.self).filter("userId == %@", userId)
//    private var notificationToken: NotificationToken?
//
//    public var userId: Int?
//    var friendTitle = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let userId = userId {
//            networkService.fetchPhotos(for: userId) { [weak self] photos in
//                try? RealmProvider.save(items: photos)
//            }
//        }
//
//        notificationToken = photos?.observe { [weak self] change in
//            guard let self = self else { return }
//            switch change {
//            case .initial:
//                break
//            case .update:
//                self.collectionView.reloadData()
//            case .error(let error):
//                self.show(error)
//            }
//        }
//
//        self.title = friendTitle
//    }
//
//    // MARK: UICollectionViewDataSource
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos?.count ?? 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
//
//        guard let photo = photos?[indexPath.row] else { return cell }
//        cell.configure(with: photo)
//
//        return cell
//    }
//}
