//
//  InfomationViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "InfomationViewController.h"
#import "SWRevealViewController.h"

@interface InfomationViewController ()

@end

@implementation InfomationViewController
{
    NSArray *arrayOfInfoImage;
}

- (void)viewDidLoad {

    //Hamburger btn
    [super viewDidLoad];
    _backButtonOfInfo.target = self.revealViewController;
    _backButtonOfInfo.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // array
    arrayOfInfoImage = [[NSArray alloc]initWithObjects:@"sasa2.png",@"sasa3.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
