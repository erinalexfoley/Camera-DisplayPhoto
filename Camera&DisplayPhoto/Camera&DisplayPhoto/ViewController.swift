//
//  ViewController.swift
//  Camera&DisplayPhoto
//
//  Created by Erin Foley on 8/11/20.
//  Copyright © 2020 Erin Foley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
        
    var imagePicker = UIImagePickerController() // create an object from UIImagePickerController class & store in variable
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary //open photo lib
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var displayImage: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // update our photo with the selected photo
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            displayImage.image = selectedImage
        }
        
        // go back to our ViewController so the user can see the update
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takeSelfieTapped(_ sender: UIButton) {
           imagePicker.sourceType = .camera // open camera
           
           //present = built in function from Apple; imagePicker = which ViewController to present; animated: true = makes a smooth transition
               
           present(imagePicker, animated: true, completion: nil)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self // tell the object to give any info back to this class (self)
    }
    
}

