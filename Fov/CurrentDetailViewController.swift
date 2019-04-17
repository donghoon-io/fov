//
//  CurrentDetailViewController.swift
//  Fov
//
//  Created by Donghoon Shin on 16/04/2019.
//  Copyright © 2019 Donghoon Shin. All rights reserved.
//

import UIKit

class CurrentDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return detailImageArray[indexPath.item%3]?.size.height ?? 50
    }
    
    func collectionView(_ collectionView: UICollectionView, widthForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return detailImageArray[indexPath.item%3]?.size.width ?? 50
    }

    var detailImageArray = [UIImage(named: "collectionviewimg1"),UIImage(named: "collectionviewimg2"),UIImage(named: "symbol1")]
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var reviewButton: UIButton! {
        didSet {
            reviewButton.layer.masksToBounds = true
            reviewButton.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var detailImagesCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailCollectionView {
            return 3
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentDetailCell", for: indexPath) as! CurrentDetailCollectionViewCell
            cell.detailImage.layer.cornerRadius = 5
            cell.detailImage.image = detailImageArray[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailImagesCell", for: indexPath) as! DetailImagesCollectionViewCell
            cell.detailImagesImage.layer.cornerRadius = 5
            cell.detailImagesImage.image = detailImageArray[indexPath.item % 3]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == detailCollectionView {
            return CGSize(width: detailCollectionView.frame.width/1.5, height: detailCollectionView.frame.height)
        } else {
            return CGSize(width: detailImagesCollectionView.frame.width/1.5, height: detailImagesCollectionView.frame.height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeNavLogo(self)
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        detailImagesCollectionView.delegate = self
        detailImagesCollectionView.dataSource = self
        
        if let layout = detailImagesCollectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reviewDetail" {
            let vc = segue.destination as! AddReviewViewController
            vc.titleString = titleLabel.text ?? ""
        }
    }
}
