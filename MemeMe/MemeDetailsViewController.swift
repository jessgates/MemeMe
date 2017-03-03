//
//  MemeDetailsViewController.swift
//  MemeMe
//
//  Created by Jess Gates on 6/10/16.
//  Copyright © 2016 Jess Gates. All rights reserved.
//

import UIKit

class MemeDetailsViewController: UIViewController {
    
    @IBOutlet weak var memeDetailImage: UIImageView!
    
    var savedMeme: MemeProperties!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        memeDetailImage.image = savedMeme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
