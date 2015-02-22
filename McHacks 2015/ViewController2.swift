//
//  ViewController2.swift
//  McHacks 2015
//
//  Created by Suraj Rampure on 2015-02-21.
//  Copyright (c) 2015 Suraj Rampure. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var capturedImageView: UIImageView!
    
    var image: UIImage = UIImage()
    
    var numberOfShades: Int = Int()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        capturedImageView.image = self.image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SecondToThird" {
            let vc3 = segue.destinationViewController as ViewController3
            vc3.image = self.image
        }
    }


}
