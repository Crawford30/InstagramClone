//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by Joel Crawford on 6/8/24.
//  Copyright © 2024 JOEL CRAWFORD. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        
        //Dealing with accessbility for visually impaired
        accessibilityLabel = "User Post Image"
        accessibilityHint = "Double-tap to open post"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    public func configure(with model: UserPost){
        let thumbnailURL = model.thumbnailImageURL
        
//        //Download the image
//        let task = URLSession.shared.dataTask(with: thumbnailURL) { data, _, _ in
//            self.photoImageView.image = UIImage(data: data!)
//        }
        
        
        //Using third party lib to dowload
        photoImageView.sd_setImage(with: thumbnailURL, completed: nil)
        
        
    }
    
    
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
}
