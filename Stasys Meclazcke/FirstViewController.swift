//
//  FirstViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/14/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var meImage: UIImageView!
    @IBOutlet var learnLabel: UILabel!
    @IBOutlet var plus1: UIButton!
    
    struct variables {
        static var pressed = false
    }
    
    override func viewWillAppear(animated: Bool) {
        //nameLabel.center.x -= view.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        let rect = CGRect(x: nameLabel.frame.origin.x, y: nameLabel.frame.origin.y, width: nameLabel.frame.size.width, height: nameLabel.frame.size.height)
        let shimmeringView = FBShimmeringView(frame: rect)
        shimmeringView.contentView = nameLabel
        shimmeringView.shimmering = true
        shimmeringView.center.x = self.view.center.x
        self.view.addSubview(shimmeringView)
        
        meImage.layer.cornerRadius = meImage.frame.size.width/2
        meImage.clipsToBounds = true
                
        SCLAlertView().showNotice("Hey!", subTitle: "Thanks for checking out my app! Please tap the bottom right button if you like what you see on each page to see the score in the end!", closeButtonTitle: "Gotcha", duration: 0.0)
        
        nameLabel.center.x -= view.bounds.width
        UIView.animateWithDuration(0.5, animations: {
            self.nameLabel.center.x += self.view.bounds.width
        })
    }
    @IBAction func plus1(sender: AnyObject) {
        if (variables.pressed == false) {
            globalScore += 1
            NSUserDefaults().setInteger(globalScore, forKey: "globalKey")
            plus1.setImage(UIImage(named: "Plus1P"), forState: UIControlState.Normal)
            variables.pressed = true
            
            // I'm liking these animations
            var transformAnim = CAKeyframeAnimation(keyPath:"transform")
            transformAnim.values = [NSValue(CATransform3D: CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, -1)),
                NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(3 * CGFloat(M_PI/180), 0, 0, 1))),
                NSValue(CATransform3D: CATransform3DMakeScale(1.5, 1.5, 1)),
                NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(-8 * CGFloat(M_PI/180), 0, 0, 1)))]
            transformAnim.keyTimes = [0, 0.349, 0.618, 1]
            transformAnim.duration = 1
            self.meImage.layer.addAnimation(transformAnim, forKey: "transform")
        }
        else if (variables.pressed == true) {
            globalScore -= 1
            NSUserDefaults().setInteger(globalScore, forKey: "globalKey")
            plus1.setImage(UIImage(named: "Plus1"), forState: UIControlState.Normal)
            variables.pressed = false
        }
    }
}
