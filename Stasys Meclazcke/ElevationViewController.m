//
//  ElevationViewController.m
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/23/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import "ElevationViewController.h"
@import CoreLocation;

@interface ElevationViewController () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ElevationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.view.frame;
    [self.bgImage addSubview:blurView];
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
    [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    [_locationManager setDelegate:self];
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"elevation"] > 2000) {
        self.graphView.image = [UIImage imageNamed:@"Graph1"];
    }
    else if([[NSUserDefaults standardUserDefaults] integerForKey:@"elevation"] < 2000) {
        self.graphView.image = [UIImage imageNamed:@"Graph2"];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [[NSUserDefaults standardUserDefaults] setInteger: newLocation.altitude * 3.28084 forKey:@"elevation"];
    self.yourElevation.text = [NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"elevation"]];
    [self.locationManager stopUpdatingLocation];
}

@end
