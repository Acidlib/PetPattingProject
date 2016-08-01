//
//  MainModelData.h
//  PatPet
//
//  Created by Yi-Ling Wu on 7/23/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "JSQMessages.h"

static NSString * const Owner = @"MEIBOW";
static NSString * const user1 = @"Tom";
static NSString * const user2 = @"JESS";
static NSString * const user3 = @"XAV";
static NSString * const user4 = @"PIPI";
static NSString * const user5 = @"COMEI";
static NSString * const user6 = @"EDDIE";
static NSString * const user7 = @"LILI";
static NSString * const user8 = @"MAOBAO";
static NSString * const user9 = @"MEIZAI";
static NSString * const user10 = @"REGGIE";

static NSString * const OwnerId = @"000";
static NSString * const userId_1 = @"001";
static NSString * const userId_2 = @"002";
static NSString * const userId_3 = @"003";
static NSString * const userId_4 = @"004";
static NSString * const userId_5 = @"005";
static NSString * const userId_6 = @"006";
static NSString * const userId_7 = @"007";
static NSString * const userId_8 = @"008";
static NSString * const userId_9 = @"009";
static NSString * const userId_10 = @"010";

@interface MainModelData : NSObject

@property (strong, nonatomic) NSMutableArray *featuresAttrib_fileName;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_nickName;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_species;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_gender;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_age;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_distance;
@property (strong, nonatomic) NSMutableArray *featuresAttrib_Favorite;

@property (strong, nonatomic) NSMutableArray *favoriteList;
@property (strong, nonatomic) NSMutableArray *searchList;

@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSMutableArray *messages1;
@property (strong, nonatomic) NSMutableArray *messages2;
@property (strong, nonatomic) NSMutableArray *messages3;
@property (strong, nonatomic) NSMutableArray *messages4;
@property (strong, nonatomic) NSMutableArray *messages5;
@property (strong, nonatomic) NSMutableArray *messages6;
@property (strong, nonatomic) NSMutableArray *messages7;
@property (strong, nonatomic) NSMutableArray *messages8;
@property (strong, nonatomic) NSMutableArray *messages9;
@property (strong, nonatomic) NSMutableArray *messages10;

@property (strong, nonatomic) NSDictionary *avatars;
@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;
@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;
@property (strong, nonatomic) NSDictionary *users;

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion;
- (void)addPhotoMediaMessage;
- (void)addVideoMediaMessage;
- (void)addAudioMediaMessage;

@end
