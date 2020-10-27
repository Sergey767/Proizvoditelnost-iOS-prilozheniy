//
//  PhotoCell.swift
//  Vkontakte
//
//  Created by Серёжа on 11/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit
import Kingfisher
import AsyncDisplayKit

class PhotoNode: ASCellNode {
    
    private let photoImageNode = ASNetworkImageNode()
    private let resource: ImageNodeRepresentable
    
    init(resource: ImageNodeRepresentable) {
        self.resource = resource
        super.init()
        
        setupSabnodes()
    }
    
    private func setupSabnodes() {
        addSubnode(photoImageNode)
        //photoImageNode.url = resource.urlString
        photoImageNode.contentMode = .scaleToFill
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let size = constrainedSize.max.width
        photoImageNode.style.preferredSize = CGSize(
            width: size,
            height: size * resource.aspectRatio
        )
        
        return ASWrapperLayoutSpec(layoutElement: photoImageNode)
    }
}

//class PhotoCell: UICollectionViewCell {
//
//    static let reuseIdentifier = "PhotoCell"
//
//    @IBOutlet private weak var photoImageView: UIImageView!
//
//    func configure(with photo: Photo) {
//
//        let url = URL(string: photo.urlString)
//        photoImageView.kf.setImage(with: url)
//    }
//}
