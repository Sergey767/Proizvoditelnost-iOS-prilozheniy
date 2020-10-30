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
    
    init(resource: Photo) {
        self.resource = resource
        super.init()
        backgroundColor = UIColor.red
        
        setupSabnodes()
    }
    
    private func setupSabnodes() {
        photoImageNode.url = URL(string: resource.urlString)
        photoImageNode.contentMode = .scaleToFill
        photoImageNode.shouldRenderProgressImages = true
        
        addSubnode(photoImageNode)
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
