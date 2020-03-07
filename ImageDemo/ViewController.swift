//
//  ViewController.swift
//  ImageDemo
//
//  Created by User on 06/03/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var imageArr = [PhotoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFromServer()
    }
    
    private func getDataFromServer() {
        self.getImageData { (data) in
            if let images = data {
                self.imageArr = images
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell {
            cell.selectedImage = self.imageArr[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: (width/2) - 25, height: 150)
    }
}
