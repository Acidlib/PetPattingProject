//
//  NavigationViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/10/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *activateLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnPreference;
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;

@end
