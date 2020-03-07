//
//  ImageCollectionViewCell.swift
//  ImageDemo
//
//  Created by User on 06/03/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    private var imageUrl = "https://picsum.photos/300/300?image="
    
    static var Images = [String]()
    
    public var selectedImage: PhotoModel? {
        didSet {
            if let image = self.selectedImage {
                self.authorNameLabel.text = image.author
                
                DispatchQueue.global().async {
                    if let url = URL(string: "\(self.imageUrl)"+"\(image.id)") {
                        if let data = try? Data(contentsOf: url) {
                            if let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    self.authorImageView.image = image
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
