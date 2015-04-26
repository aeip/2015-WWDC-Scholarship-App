//
//  PreviewViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/23/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var previewImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        previewImage.image = UIImage(named: "iMessage")
    }
}
