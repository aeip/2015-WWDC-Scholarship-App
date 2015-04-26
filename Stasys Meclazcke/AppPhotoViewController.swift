//
//  AppPhotoViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/22/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

class AppPhotoViewController: UIViewController {
    @IBOutlet var photo: UIImageView!
    @IBOutlet var bgImage: UIImageView!

    var detailScreenshot: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        photo.image = detailScreenshot
    }
}
