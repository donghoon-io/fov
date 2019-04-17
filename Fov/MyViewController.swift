//
//  MyViewController.swift
//  Fov
//
//  Created by Donghoon Shin on 17/04/2019.
//  Copyright © 2019 Donghoon Shin. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recordCell", for: indexPath) as! RecordCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: recordCollectionView.frame.width/3-10, height: recordCollectionView.frame.width/3-10)
    }
    
    @IBOutlet weak var recordCollectionView: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.masksToBounds = true
            profileImage.layer.cornerRadius = profileImage.frame.width/2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        recordCollectionView.delegate = self
        recordCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
