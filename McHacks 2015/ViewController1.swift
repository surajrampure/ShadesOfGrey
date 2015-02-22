//
//  ViewController.swift
//  McHacks 2015
//
//  Created by Suraj Rampure on 2015-02-21.
//  Copyright (c) 2015 Suraj Rampure. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoImageView = UIImageView(frame: CGRectMake(45, 131, 229, 306))
    
    var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addSubview(photoImageView)
        
        nextButton.hidden = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func openPhotoLibrary(sender: AnyObject) {
        
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        
        self.presentViewController(photoPicker, animated: true, completion: nil)
        
        
    }
    @IBAction func openCamera(sender: AnyObject) {
        
        var camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = .Camera
        
        self.presentViewController(camera, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(false, completion: nil)
        
        nextButton.hidden = false
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FirstToSecond" {
            //showImage.image = photoImageView.image
            let vc2 = segue.destinationViewController as ViewController2
            vc2.image = photoImageView.image!
        }
    }
    
}

