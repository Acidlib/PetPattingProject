//
//  chatMainContentViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/24/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "chatMainContentViewController.h"

@interface chatMainContentViewController ()

@end

@implementation chatMainContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)done:(id)sender{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
