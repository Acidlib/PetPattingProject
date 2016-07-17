//
//  ProfileFavViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/23/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ProfileFavViewController : BaseViewController
@property (nonatomic, strong) UIImage *myImageFav;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *profileBackButton;
-(IBAction)done:(id)sender;
@end
