//
//  DetailViewController.m
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import "DetailViewController.h"
#import "Stasys_Meclazcke-Swift.h"
@import AVKit;
@import AVFoundation;

NSString * const kPlayerItemUrl = @"https://dl.dropboxusercontent.com/u/126297919/MSK%20Preview1080.mp4";

int globalScore2;
BOOL pressed2;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.view.frame;
    [self.bgImage addSubview:blurView];
    
    self.navigationItem.title = _detailName;
    
    if (pressed2 == 0) {
        [self.plus1 setImage:[UIImage imageNamed:@"Plus1"] forState:UIControlStateNormal];
    }
    else if (pressed2 == 1) {
        [self.plus1 setImage:[UIImage imageNamed:@"Plus1P"] forState:UIControlStateNormal];
    }
    
    if ([_detailName isEqualToString:@"EmoYo"] || [_detailName isEqualToString:@"Transylvania Development"] || [_detailName isEqualToString:@"Windows 8 Apps"] || [_detailName isEqualToString:@"Music Sharing Keyboard"]) {
        self.openButton.hidden = NO;
    }
    else {
        self.openButton.hidden = YES;
    }
    
    if ([_detailName isEqualToString:@"Windows 8 Apps"]) {
        [self.openButton setTitle:@"Check them out here" forState:UIControlStateNormal];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.iconImage.image = _detailImage;
    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width/6.4;
    self.iconImage.clipsToBounds = YES;
    
    self.appDescription.text = _detailDescription;
}
- (IBAction)plus1:(id)sender {
    if (pressed2 == false) {
        globalScore2 += 1;
        [[NSUserDefaults standardUserDefaults] setInteger:globalScore2 forKey:@"globalKey2"];
        [self.plus1 setImage:[UIImage imageNamed:@"Plus1P"] forState:UIControlStateNormal];
        pressed2 = true;
        
        CAKeyframeAnimation * transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        transformAnim.values                = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(3 * M_PI/180, 0, 0, -1)],
                                                [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(3 * M_PI/180, 0, 0, 1))],
                                                [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)],
                                                [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeRotation(-8 * M_PI/180, 0, 0, 1))]];
        transformAnim.keyTimes              = @[@0, @0.349, @0.618, @1];
        transformAnim.duration              = 1;
        [self.iconImage.layer addAnimation:transformAnim forKey:@"test"];
    }
    else if (pressed2 == true) {
        globalScore2 -= 1;
        [[NSUserDefaults standardUserDefaults] setInteger:globalScore2 forKey:@"globalKey2"];
        [self.plus1 setImage:[UIImage imageNamed:@"Plus1"] forState:UIControlStateNormal];
        pressed2 = false;
    }
}
- (IBAction)openButton:(id)sender {
    NSURL *targetURL = [NSURL URLWithString:@""];
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([_detailName isEqualToString:@"EmoYo"]) {
        targetURL = [NSURL URLWithString:@"https://itunes.apple.com/us/app/emoyo/id900324602?ls=1&mt=8"];
            [application openURL:targetURL];
    }
    else if ([_detailName isEqualToString:@"Transylvania Development"]) {
        targetURL = [NSURL URLWithString:@"https://itunes.apple.com/us/app/transylvania-developments/id923859642?mt=8"];
            [application openURL:targetURL];
    }
    else if ([_detailName isEqualToString:@"Windows 8 Apps"]) {
        targetURL = [NSURL URLWithString:@"http://aeipsapps.tumblr.com/"];
            [application openURL:targetURL];
    }
    else if ([_detailName isEqualToString:@"Music Sharing Keyboard"]) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            
            NSURL *url = [NSURL URLWithString:kPlayerItemUrl];
            AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
            AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
            
            AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
            playerViewController.player = player;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self presentViewController:playerViewController
                                   animated:YES
                                 completion:^{
                                 }];
            });
        });
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"showPhoto"]) {
        AppPhotoViewController *detailVC = segue.destinationViewController;
        detailVC.detailScreenshot = self.screenshotImage;
    }
}

@end
