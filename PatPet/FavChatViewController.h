//
//  FavChatViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/24/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface FavChatViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *favchatBackButton;
-(IBAction)done:(id)sender;

@end
