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

typedef NS_ENUM(NSInteger, messageSource) {
    messageFromAnyProfile = 0,
    messageFromChat
};

@interface MessageViewController : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>

@property (nonatomic) messageSource msgSource;
@property (nonatomic) NSInteger cellIndex;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *img;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *messageBackButton;
-(IBAction)done:(id)sender;

@property (strong, nonatomic) MainModelData *demoData;

@end
