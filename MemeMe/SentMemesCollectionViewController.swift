//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Jess Gates on 6/10/16.
//  Copyright © 2016 Jess Gates. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [MemeProperties] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space : CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
        collectionView?.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionCell", for: indexPath) as! MemeCollectionViewCell
        
        let memeSelection = memes[indexPath.row]
        
        cell.memeThumbImage.image = memeSelection.memedImage
        cell.memeThumbImage?.contentMode = UIViewContentMode.scaleAspectFill
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailsViewController") as! MemeDetailsViewController
        
        detailController.savedMeme = memes[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }
    
}
