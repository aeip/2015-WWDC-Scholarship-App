//
//  AppsViewController.h
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppsTableViewCell.h"

@interface AppsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (nonatomic, retain) UIImage *iconImage;
@property (nonatomic, retain) NSString *appName;
@property (nonatomic, retain) NSString *appDescription;
@property (nonatomic, retain) UIImage *appScreenshot;

@end
