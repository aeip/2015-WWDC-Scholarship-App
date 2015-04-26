//
//  AppsViewController.m
//  Stasys Meclazcke
//
//  Created by Stasy Meclazcke on 4/20/15.
//  Copyright (c) 2015 Briskley, LLC. All rights reserved.
//

#import "AppsViewController.h"
#import "DetailViewController.h"

@interface AppsViewController ()

@end

@implementation AppsViewController
{
    NSArray *apps;
    NSArray *images;
    NSArray *status;
    NSArray *price;
    NSArray *description;
    NSArray *screenshots;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.view.frame;
    [self.bgImage addSubview:blurView];
    
    self.navigationController.navigationBar.topItem.title = @"Apps";

    
    apps = [NSArray arrayWithObjects:@"3 Winks", @"Music Sharing Keyboard", @"EmoYo", @"Freesy", @"Moovie", @"Speede", @"Transylvania Development", @"After WWDC", @"Windows 8 Apps", nil];
    images = [NSArray arrayWithObjects:@"3 Winks", @"Music Sharing Keyboard", @"EmoYo", @"Coming Soon", @"Coming Soon", @"Speede", @"Transylvania Development", @"Coming Soon", @"Windows 8", nil];
    status = [NSArray arrayWithObjects:@"In Development", @"Rejected", @"Live", @"In Development", @"In Development", @"Completed", @"Live", @"In Design", @"Live", nil];
    price = [NSArray arrayWithObjects:@"Free", @"Free", @"Free", @"Free", @"Free", @"$0.99", @"Free", @"Free", @"Free", nil];
    description = [NSArray arrayWithObjects:
                   @"3 Winks is an app which allows you to share 3 things you like at the moment. You can choose a song, photo, or quote to show who you are. I plan to release this before WWDC. This app was built with Parse.",
                   @"Music Sharing Keyboard is exactly what it sounds like. It's a custom iOS 8 keyboard which allows you to search for a song on iTunes, and send the 30 second preview to friends via iMessage. Unfortunately, I can't upload this app until iMessage has a way to stream data instead of downloading it.",
                   @"EmoYo is a simple app which allows you to share your current emotion with friends. You can share if you're happy, sad, etc. This app was built with Parse.",
                   @"Freesy is an app I haven't been working on in a while, but plan to finish it soon. This app let's you choose whether you're free or busy, and allows notifications or messages to be sent if you choose free and doesn't let them send if you choose busy. I'd like to add a 'Today Extension' to it to make it easier to change your status.",
                   @"Moovie is an Apple Watch app which allows you to check what movies are currently playing and allows you to see details and trailers about those movies on the watch. I'm using the Fandango API to get the data. I plan to release this soon.",
                   @"Speede is a simple speedometer. I wanted an app to see how fast I was going and to tell me when I was speeding. There weren't any, so I decided to build it myself.",
                   @"Transylvania Development is an app I was hired to make by a friend. This app uses Parse to load projects of a company and allows you to get in contact with them if you're interested. The app information and projects can be updated online thanks to Parse.",
                   @"After WWDC, I plan to make a number of apps that use Apple's new technology and makes people's lives easier. Some app ideas I have in mind are: A menu app for restuarants using iBeacon for Apple Watch, Camera Keyboard which allows you to take a picture of text and it types it into the custom keyboard, a movie sharing keyboard to find and share movies within the keyboard, and many more. I hope to use the new technology from WWDC 2015 to make new apps as well.",
                   @"Over the summer and winter break of 2013, I made 30 Windows 8 apps. Most of these apps are games and were made in JavaScript/C#. These apps helped me make enough money to buy a Macbook and start creating iOS apps. I have to say, I like making iOS apps the most. It's a lot better and funner than Windows 8 apps or any others. I've learned C#, Ruby on Rails, VB, PHP, and Java, but Objective-C and Swift are my favorite.", nil];
    screenshots = [NSArray arrayWithObjects:@"3 Winks Screenshot", @"Music Sharing Keyboard Screenshot", @"EmoYo Screenshot", @"Freesy Screenshot", @"Moovie Screenshot", @"Speede Screenshot", @"Transylvania Development Screenshot", @"WWDC Screenshot", @"Windows 8 Apps Screenshot", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [apps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppsCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.nameLabel.text = [apps objectAtIndex:indexPath.row];
    
    cell.iconImage.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    cell.iconImage.layer.cornerRadius = cell.iconImage.frame.size.width/6.4;
    cell.iconImage.clipsToBounds = YES;
    
    cell.statusLabel.text = [status objectAtIndex:indexPath.row];
    
    cell.priceLabel.text = [price objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.iconImage = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    self.appName = [apps objectAtIndex:indexPath.row];
    self.appDescription = [description objectAtIndex:indexPath.row];
    self.appScreenshot = [UIImage imageNamed:[screenshots objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"showDetail"]) {
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.detailImage = self.iconImage;
        detailVC.detailName = self.appName;
        detailVC.detailDescription = self.appDescription;
        detailVC.screenshotImage = self.appScreenshot;
    }
}

@end
