//
//  AddReviewViewController.swift
//  Fov
//
//  Created by Donghoon Shin on 17/04/2019.
//  Copyright © 2019 Donghoon Shin. All rights reserved.
//

import UIKit

class AddReviewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var titleString = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var uploadButton: UIButton! {
        didSet {
            uploadButton.layer.masksToBounds = true
            uploadButton.layer.cornerRadius = 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell1", for: indexPath) as! ReviewCollectionViewCell
        
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
        
        cell.symbol1.layer.cornerRadius = 5
        cell.symbol2.layer.cornerRadius = 5
        cell.symbol3.layer.cornerRadius = 5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: reviewCollectionView.frame.width, height: 140)
    }
    

    @IBOutlet weak var reviewCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(titleString) 전시 후기"
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
