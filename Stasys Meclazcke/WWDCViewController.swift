//
//  WWDCViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

class WWDCViewController: UIViewController {
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var plus1: UIButton!
    @IBOutlet var coverImage: UIImageView!
    
    struct variables {
        static var pressed = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
    }
    @IBAction func plus1(sender: AnyObject) {
        if (variables.pressed == false) {
            globalScore += 1
            NSUserDefaults().setInteger(globalScore, forKey: "globalKey")
            plus1.setImage(UIImage(named: "Plus1P"), forState: UIControlState.Normal)
            
            var transformAnim = CAKeyframeAnimation(keyPath:"transform")
            transformAnim.values = [NSValue(CATransform3D: CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, -1)),
                NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, 1))),
                NSValue(CATransform3D: CATransform3DMakeScale(1.5, 1.5, 1)),
                NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(-8 * CGFloat(M_PI/180), 0, 0, 1)))]
            transformAnim.keyTimes = [0, 0.349, 0.618, 1]
            transformAnim.duration = 1
            self.coverImage.layer.addAnimation(transformAnim, forKey: "transform")
            
            variables.pressed = true
        }
        else if (variables.pressed == true) {
            globalScore -= 1
            NSUserDefaults().setInteger(globalScore, forKey: "globalKey")
            plus1.setImage(UIImage(named: "Plus1"), forState: UIControlState.Normal)
            variables.pressed = false
        }
    }
}
