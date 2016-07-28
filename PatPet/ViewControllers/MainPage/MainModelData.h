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

static NSString * const kJSQDemoAvatarDisplayNameSquires = @"Jesse Squires";
static NSString * const kJSQDemoAvatarDisplayNameCook = @"Tim Cook";
static NSString * const kJSQDemoAvatarDisplayNameJobs = @"Jobs";
static NSString * const kJSQDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString * const kJSQDemoAvatarIdSquires = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdCook = @"468-768355-23123";
static NSString * const kJSQDemoAvatarIdJobs = @"707-8956784-57";
static NSString * const kJSQDemoAvatarIdWoz = @"309-41802-93823";

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
@property (strong, nonatomic) NSDictionary *avatars;
@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;
@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;
@property (strong, nonatomic) NSDictionary *users;

- (void)addPhotoMediaMessage;
- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion;
- (void)addVideoMediaMessage;
- (void)addAudioMediaMessage;

@end
