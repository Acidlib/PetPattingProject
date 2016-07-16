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

@interface NavigationViewController ()

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
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
