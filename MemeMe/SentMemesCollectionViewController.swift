//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Jess Gates on 6/10/16.
//  Copyright © 2016 Jess Gates. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    
    var memes: [MemeProperties] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
}
