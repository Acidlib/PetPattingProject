//
//  MessageViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/24/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "JSQMessagesViewController.h"
#import "MainModelData.h"

@interface MessageViewController : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *img;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *messageBackButton;
-(IBAction)done:(id)sender;

@property (strong, nonatomic) MainModelData *demoData;
- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

@end
