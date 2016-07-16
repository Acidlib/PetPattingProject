//
//  ProfileViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/22/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *myName;
@property (nonatomic, weak) IBOutlet UILabel *myAge;
@property (nonatomic, weak) IBOutlet UILabel *myDistance;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.image = self.myImage;
    self.myName.text = self.myStringName;
    self.myAge.text = self.myStringAge;
    self.myDistance.text = self.myStringDistance;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
