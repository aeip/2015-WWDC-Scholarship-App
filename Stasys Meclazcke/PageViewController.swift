//
//  PageViewController.swift
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/14/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

import UIKit

var globalScore = 0

@objc protocol MyDelegate{
    optional func makeScore()
}

class PageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var bgImage: UIImageView!

    var delegate:MyDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        bgImage.addSubview(blurView)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewControllerWithIdentifier("First") as! FirstViewController
        let vc2 = storyboard.instantiateViewControllerWithIdentifier("Apps") as! AppsViewController
        let vc3 = storyboard.instantiateViewControllerWithIdentifier("About") as! AboutViewController
        let vc4 = storyboard.instantiateViewControllerWithIdentifier("Education") as! EducationViewController
        let vc5 = storyboard.instantiateViewControllerWithIdentifier("WWDC") as! WWDCViewController
        let vc6 = storyboard.instantiateViewControllerWithIdentifier("Score") as! ScoreViewController
        
        self.delegate = vc6
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.view.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: ALEdge.Right)
        vc1.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc1.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)
        
        self.addChildViewController(vc2)
        self.scrollView.addSubview(vc2.view)
        vc2.view.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: vc1.view)
        vc2.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc2.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)
        
        self.addChildViewController(vc3)
        self.scrollView.addSubview(vc3.view)
        vc3.view.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: vc2.view)
        vc3.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc3.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)
        
        self.addChildViewController(vc4)
        self.scrollView.addSubview(vc4.view)
        vc4.view.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: vc3.view)
        vc4.view.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Top, ofView: self.scrollView)
        vc4.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc4.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)
        
        self.addChildViewController(vc5)
        self.scrollView.addSubview(vc5.view)
        vc5.view.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: vc4.view)
        vc5.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc5.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)
        
        self.addChildViewController(vc6)
        self.scrollView.addSubview(vc6.view)
        vc6.view.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: vc5.view)
        vc6.view.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: ALEdge.Left)
        vc6.view.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.scrollView)
        vc6.view.autoMatchDimension(ALDimension.Height, toDimension: ALDimension.Height, ofView: self.scrollView)

        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]

        scrollView.delegate = self
        
        self.navigationController!.navigationBar.topItem!.title = ""
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        NSUserDefaults().setInteger(0, forKey: "globalKey")
        NSUserDefaults().setInteger(0, forKey: "globalKey2")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let svOffset:Int = Int(self.scrollView.contentOffset.x)
        let sWidth:Int = Int(self.view.frame.size.width)
        
        if(svOffset == 0) {
            self.navigationController!.navigationBar.topItem!.title = ""
        }
        else if(svOffset == sWidth) {
            self.navigationController!.navigationBar.topItem!.title = "Apps"
        }
        else if(svOffset == sWidth*2) {
            self.navigationController!.navigationBar.topItem!.title = "About"
        }
        else if(svOffset == sWidth*3) {
            self.navigationController!.navigationBar.topItem!.title = "Education"
        }
        else if(svOffset == sWidth*4) {
            self.navigationController!.navigationBar.topItem!.title = "WWDC"
        }
        else if(svOffset == sWidth*5) {
            self.navigationController!.navigationBar.topItem!.title = "Score"
            delegate?.makeScore!()
        }
    }
}
