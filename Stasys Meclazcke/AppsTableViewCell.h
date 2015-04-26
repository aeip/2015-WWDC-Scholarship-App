//
//  AppsTableViewCell.h
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
