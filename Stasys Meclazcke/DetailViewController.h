//
//  DetailViewController.h
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, retain) UIImage *detailImage;
@property (nonatomic, retain) NSString *detailName;
@property (nonatomic, retain) NSString *detailDescription;
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UITextView *appDescription;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIButton *plus1;
@property (strong, nonatomic) IBOutlet UIButton *openButton;

@property (nonatomic, retain) UIImage *screenshotImage;

@end
