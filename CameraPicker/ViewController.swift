//
//  ViewController.swift
//  CameraPicker
//
//  Created by LimeTray on 06/06/17.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    enum CameFrom {
        case gallery
        case camera
    }
    var cameFrom: CameFrom = .gallery
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pickImage: UIButton!
    
    @IBAction func showActionSheet(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Method", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            self.openCamera()
            self.cameFrom = .camera
        })
        
        let gallery = UIAlertAction(title: "Gallery", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            self.openGallery()
            self.cameFrom = .gallery
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(gallery)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(ViewController.openPicker))
        imageView.addGestureRecognizer(imageTapped)
    }

    //Gesture Recogonizer
    func openPicker() {
        switch cameFrom {
            case .camera: openCamera()
            case .gallery: openGallery()
        }
        print(cameFrom)
    }
    
    //imagePicker functions
    func openCamera() {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.imagePicker.allowsEditing = true
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func openGallery() {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.imagePicker.allowsEditing = true
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    //Delegates?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage? = UIImage()
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        if image != nil {   imageView.image = image}
        dismiss(animated: true, completion: nil)
    }
    
}

