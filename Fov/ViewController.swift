//
//  ViewController.swift
//  Fov
//
//  Created by Donghoon Shin on 12/04/2019.
//  Copyright © 2019 Donghoon Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let imgArray = [UIImage(named: "collectionviewimg1"),UIImage(named: "collectionviewimg2"),UIImage(named: "symbol1")]
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return imgArray.count
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
            cell.mainImage.image = imgArray[indexPath.item]
            cell.mainImage.layer.cornerRadius = 3
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewCollectionViewCell
            
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
            cell.symbol1.layer.cornerRadius = 5
            cell.symbol2.layer.cornerRadius = 5
            cell.symbol3.layer.cornerRadius = 5
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: mainCollectionView.frame.width/1.5, height: mainCollectionView.frame.height)
        } else {
            return CGSize(width: reviewCollectionView.frame.width, height: 140)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavLogo(self)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
    }
    
}

func makeNavLogo(_ vc: UIViewController) {
    let navController = vc.navigationController!
    let image = UIImage(named: "nav_logo")
    let imageView = UIImageView(image: image)
    let bannerWidth = navController.navigationBar.frame.size.width
    let bannerHeight = navController.navigationBar.frame.size.height
    imageView.frame = CGRect(x: 0, y: 0, width: bannerWidth, height: bannerHeight)
    imageView.contentMode = .scaleAspectFit
    vc.navigationItem.titleView = imageView
}
