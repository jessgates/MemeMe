//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Jess Gates on 6/10/16.
//  Copyright © 2016 Jess Gates. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var memes: [MemeProperties] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
        tableView!.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell")!
        let memeSelection = memes[indexPath.row]
        
        cell.textLabel!.text = memeSelection.topText + memeSelection.bottomText
        cell.imageView!.image = memeSelection.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailsViewController") as! MemeDetailsViewController
        
        detailController.savedMeme = memes[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        
        if editingStyle == .delete {
            let applicationDelegate = (UIApplication.shared.delegate as! AppDelegate)
            
            applicationDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        
        let applicationDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        let memeToMove = memes[fromIndexPath.row]
        
        applicationDelegate.memes.remove(at: fromIndexPath.row)
        applicationDelegate.memes.insert(memeToMove, at: toIndexPath.row)
    }
    
    @IBAction func startEditing(_ sender: UIBarButtonItem) {
        self.isEditing = !self.isEditing
    }
}
