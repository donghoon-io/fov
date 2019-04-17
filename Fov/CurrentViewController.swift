//
//  CurrentViewController.swift
//  Fov
//
//  Created by Donghoon Shin on 16/04/2019.
//  Copyright © 2019 Donghoon Shin. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var imageArray = [UIImage(named: "collectionviewimg1"),UIImage(named: "collectionviewimg2"),UIImage(named: "symbol1")]
    var nameArray = ["Lorem", "Ipsum", "dolor", "sir", "et"]
    var dateArray = ["2019.04.11~2019.05.12", "2019.04.11~2018.05.12", "2019.05.11~2019.12.12", "2019.03.16~2019.05.11", "2019.06.11~2019.08.25"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentCell", for: indexPath) as! CurrentCollectionViewCell
        cell.profileImage.image = imageArray[indexPath.item % 3]
        cell.profileImage.layer.cornerRadius = 5
        cell.nameLabel.text = nameArray[indexPath.item]
        cell.dateLabel.text = dateArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: currentCollectionView.frame.width, height: currentCollectionView.frame.height/4)
    }
    
    @IBOutlet weak var currentCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeNavLogo(self)

        currentCollectionView.delegate = self
        currentCollectionView.dataSource = self
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
