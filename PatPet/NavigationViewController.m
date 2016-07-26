//
//  NavigationViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/10/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"
#import "PetColor.h"
#import "YLCircle.h"

@interface NavigationViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *activateLabel_Pref;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myProfile_Top;

@end

@implementation NavigationViewController{
    NSArray *menu;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAttribute];
    menu = @[@"first",@"second",@"third"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupAttribute
{
    _mainView.backgroundColor = [PetColor lemonDarkColor];
    _nameLabel.textColor = [PetColor darkColor];
    _activateLabel.textColor = [PetColor darkColor];
    _activateLabel.text = @"Activated 30 mins ago Central Park, New York";
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self layoutForPhoneSize];
}

- (void)layoutForPhoneSize
{
    NSInteger phoneSize = [self phoneSize];
    if (phoneSize <= 1) {
        _activateLabel_Pref.constant = 10;
        _myProfile_Top.constant = 40;
    }
}

#pragma mark - Phone Size

- (NSInteger)phoneSize
{
    CGFloat length = MAX([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    /*
     PhoneSizeSmall,
     PhoneSizeMedium,
     PhoneSizeLarge,
     PhoneSizeExtraLarge
     */
    if (length < 568)
        return 0;
    else if (length >= 568 && length < 667)
        return 1;
    else if (length >= 667 && length < 736)
        return 2;
    else
        return 3;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;

        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {

            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };

    }
    
}

@end
