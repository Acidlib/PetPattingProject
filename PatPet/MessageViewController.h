//
//  MessageViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/24/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *messageBackButton;
-(IBAction)done:(id)sender;
@end
