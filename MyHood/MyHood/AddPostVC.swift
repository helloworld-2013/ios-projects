//
//  AddPostVC.swift
//  MyHood
//
//  Created by Indra Gunawan on 2/3/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePickerVC: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
        imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
    }

    @IBAction func addImage(_ sender: UIButton!) {
        sender.setTitle("", for: .normal)
        present(imagePickerVC, animated: true, completion: nil)
    }
    
    @IBAction func savePost(_ sender: Any) {
        if let title = titleTxt.text,
            let desc = descTxt.text,
            let img = postImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(image: img)
            let post = Post(imagePath: imgPath, title: title, desc: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        postImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePickerVC.dismiss(animated: true, completion: nil)
    }
}
