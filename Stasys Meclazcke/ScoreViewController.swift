//
//  ScoreViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/21/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, MyDelegate {
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var celebrationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        var imagesArray: [UIImage] = [
            
            UIImage(named: "0")!,
            UIImage(named: "1")!,
            UIImage(named: "2")!,
            UIImage(named: "3")!,
            UIImage(named: "4")!,
            UIImage(named: "5")!,
            UIImage(named: "6")!,
            UIImage(named: "7")!,
            UIImage(named: "8")!,
            UIImage(named: "9")!,
            UIImage(named: "10")!,
            UIImage(named: "11")!,
            UIImage(named: "12")!,
            UIImage(named: "13")!,
            UIImage(named: "14")!,
            UIImage(named: "15")!,
            UIImage(named: "16")!,
            UIImage(named: "17")!,
            UIImage(named: "18")!,
            UIImage(named: "19")!,
            UIImage(named: "20")!,
            UIImage(named: "21")!,
            UIImage(named: "22")!,
            UIImage(named: "23")!,
            UIImage(named: "24")!,
            UIImage(named: "25")!,
            UIImage(named: "26")!,
            UIImage(named: "27")!,
            UIImage(named: "28")!,
            UIImage(named: "29")!,
            UIImage(named: "30")!,
            UIImage(named: "31")!,
            UIImage(named: "32")!,
            UIImage(named: "33")!,
            UIImage(named: "34")!,
            UIImage(named: "35")!,
            UIImage(named: "36")!,
            UIImage(named: "37")!,
            UIImage(named: "38")!,
            UIImage(named: "39")!,
            UIImage(named: "40")!,
            UIImage(named: "41")!,
            UIImage(named: "42")!,
            UIImage(named: "43")!,
            UIImage(named: "44")!,
            UIImage(named: "45")!,
            UIImage(named: "46")!,
            UIImage(named: "47")!,
            UIImage(named: "48")!,
            UIImage(named: "49")!,
            UIImage(named: "50")!,
            UIImage(named: "51")!,
            UIImage(named: "52")!,
            UIImage(named: "53")!,
        ]
        // How about a way to upload Gifs without having to do this?
        
        celebrationImage.animationImages = imagesArray
        celebrationImage.animationDuration = 5.0
        celebrationImage.startAnimating()
    }
    
    func makeScore() {
        var returnValue = NSUserDefaults.standardUserDefaults().integerForKey("globalKey")
        var returnValue2 = NSUserDefaults.standardUserDefaults().integerForKey("globalKey2")
        var finalValue = returnValue + returnValue2
        var scoreText : String = "You gave score of \n \(finalValue)/5"
        scoreLabel.text = scoreText
    }
}
