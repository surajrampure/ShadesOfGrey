//
//  ViewController2.swift
//  McHacks 2015
//
//  Created by Suraj Rampure on 2015-02-21.
//  Copyright (c) 2015 Suraj Rampure. All rights reserved.
//

import Foundation
import UIKit
import Social

class ViewController3: UIViewController {
    
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var showValue: UILabel!
    
    var image: UIImage = UIImage()
    
    var numberOfShades: Int = Int()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        displayImage.image = self.image
        
        doAllTheThings()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func tweetButton(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // 2
            var tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            // 3
            tweetSheet.setInitialText("This image has \(numberOfShades) shades of grey!")
            tweetSheet.addImage(displayImage.image)
            
            // 4
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            // 5
            println("error")
        }
        
    }
    // Taken from online
    
    func doAllTheThings () {
        var useImage = self.image.CGImage
        
        
        let width = CGFloat(CGImageGetWidth(useImage))
        let height = CGFloat(CGImageGetHeight(useImage))
//        let colorspace = CGColorSpaceCreateDeviceRGB()
//        let bytesPerRow = (4 * width);
//        let bitsPerComponent: UInt = 8;
        
        var pixelData = CGDataProviderCopyData(CGImageGetDataProvider(useImage))
        var data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        var greyVals: [CGFloat] = []
        
        for var x: CGFloat = 0; x < width; x += 8 {
            for var y: CGFloat = 0; y < height; y += 8 {
                //Here is your raw pixels
                
                var pixelInfo: Int = ((Int(width) * Int(y)) + Int(x)) * 4
                var r = CGFloat(data[pixelInfo])
                var g = CGFloat(data[pixelInfo+1])
                var b = CGFloat(data[pixelInfo+2])
                var a = CGFloat(data[pixelInfo+3])
                
                if r==b && b==g {
                    if (!contains(greyVals, r)) {
                        greyVals.append(r)
                    }
                }
                
            }
        }
        numberOfShades = greyVals.count
        showValue.text = "\(numberOfShades)"
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ThirdToFirst" {
            //showImage.image = photoImageView.image
            let vc1 = segue.destinationViewController as ViewController1
        }
    }
    
    
}
