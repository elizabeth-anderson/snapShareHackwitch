//
//  ViewController.swift
//  snapShareHackwitch
//
//  Created by Elizabeth on 9/28/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var images = [UIImage]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Snap Share"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(importPicture))
       
    }
    @objc func importPicture()
    {
      let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            dismiss(animated: true, completion: nil)
            images.insert(image, at: 0)
            collectionView?.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return images.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageView", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView
        {
            imageView.image = images[indexPath.item]
            
        }
        return cell
    }

}

