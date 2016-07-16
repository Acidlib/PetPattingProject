//
//  ProfileFavViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/23/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ProfileFavViewController.h"

@interface ProfileFavViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageViewFav;


@end

@implementation ProfileFavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageViewFav.image = self.myImageFav;
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
