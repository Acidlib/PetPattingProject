//
//  ProfileViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/22/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ProfileViewController : BaseViewController

@property (nonatomic) BOOL species;
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *distance;
@property (weak, nonatomic) IBOutlet UIView *gradientView;
@property (weak, nonatomic) IBOutlet UILabel *indication;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end
