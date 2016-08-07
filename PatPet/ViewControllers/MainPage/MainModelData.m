//
//  MainModelData.m
//  PatPet
//
//  Created by Yi-Ling Wu on 7/23/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "MainModelData.h"
#import "PetColor.h"
#import "NSUserDefaults+DemoSettings.h"
#import "JSQMessagesAvatarImageFactory.h"

@implementation MainModelData 

- (NSArray *)searhcList
{
    return [_searchList copy];
}

- (NSArray *)favoriteList
{
    return [_favoriteList copy];
}

- (instancetype)init
{
    self = [super init];
    if (self) {

        // txt Parser
        _featuresAttrib_fileName = [NSMutableArray new];
        _featuresAttrib_nickName = [NSMutableArray new];
        _featuresAttrib_species = [NSMutableArray new];
        _featuresAttrib_gender = [NSMutableArray new];
        _featuresAttrib_age = [NSMutableArray new];
        _featuresAttrib_distance = [NSMutableArray new];
        _featuresAttrib_Favorite = [NSMutableArray new];
        // List
        _favoriteList = [NSMutableArray new];
        _searchList = [NSMutableArray new];

        if ([NSUserDefaults emptyMessagesSetting]) {
            self.messages = [NSMutableArray new];
        }
        else {
            [self loadFakeMessages];
            [self loadProfiles];
        }

        JSQMessagesAvatarImage *ownerImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"Prof_s11"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_1 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_058"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_2 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_059"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_3 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_049"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_4 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_050"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_5 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_051"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_6 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_055"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_7 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_053"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_8 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_054"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_9 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_056"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *userImage_10 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"img_057"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];

        self.avatars = @{ OwnerId : ownerImage,
                          userId_1 : userImage_1,
                          userId_2 : userImage_2,
                          userId_3 : userImage_3,
                          userId_4 : userImage_4,
                          userId_5 : userImage_5,
                          userId_6 : userImage_6,
                          userId_7 : userImage_7,
                          userId_8 : userImage_8,
                          userId_9 : userImage_9,
                          userId_10 : userImage_10};

        self.users = @{ OwnerId : Owner,
                        userId_1 : user1,
                        userId_2 : user2,
                        userId_3 : user3,
                        userId_4 : user4,
                        userId_5 : user5,
                        userId_6 : user6,
                        userId_7 : user7,
                        userId_8 : user8,
                        userId_9 : user9,
                        userId_10 : user10};

        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];

        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[PetColor lightColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[PetColor lemonDarkColor]];
    }

    return self;
}

- (void)loadProfiles
{
    // Read Txt:
    NSString *path = [[NSBundle mainBundle] pathForResource:@"profiles" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    for (int index = 0; index < [content componentsSeparatedByString:@"\n"].count; index++) {
        NSString *snipet = [content componentsSeparatedByString:@"\n"][index];
        for (int i = 0; i < [snipet componentsSeparatedByString:@","].count; i++) {
            NSInteger distribute = i % 7;
            switch (distribute) {
                case 0:
                    [self.featuresAttrib_fileName addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 1:
                    [_featuresAttrib_nickName addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 2:
                    [_featuresAttrib_species addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 3:
                    [_featuresAttrib_gender addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 4:
                    [_featuresAttrib_age addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 5:
                    [_featuresAttrib_distance addObject:[snipet componentsSeparatedByString:@","][i]];
                    break;
                case 6:
                {
                    NSString *lastObject = [snipet componentsSeparatedByString:@","][i];
                    [_featuresAttrib_Favorite addObject:[lastObject componentsSeparatedByString:@"\r"][0]];
                }
                    break;
                default:
                    break;
            }
        }
    }

    for (int index = 0; index < _featuresAttrib_distance.count; index ++) {
        // fav == 1; notyet == 2;
        if ([self.featuresAttrib_Favorite[index] isEqualToString:@"1"]) {
            [_favoriteList addObject:[NSNumber numberWithInt:index]];
        } else {
            [_searchList addObject:[NSNumber numberWithInt:index]];
        }
    }
}

- (void)loadFakeMessages
{
    /* Message 0 */
    self.messages = [[NSMutableArray alloc] init];
    /* Message 1 */
    self.messages1 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_1 senderDisplayName:user1 date:[NSDate distantPast] text:NSLocalizedString(@"What's up?", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"Nice weather, lets go to park?", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_1 senderDisplayName:user1 date:[NSDate distantPast] text:NSLocalizedString(@"Nope, just tired", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_1 senderDisplayName:user1 date:[NSDate distantPast] text:NSLocalizedString(@"I would like to take a snap", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_1 senderDisplayName:user1 date:[NSDate distantPast] text:NSLocalizedString(@"Sleepy...zzz", nil)],
                      nil];

    self.messages2 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"Hey Pretty, free?", nil)],
                      nil];

    self.messages3 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_3 senderDisplayName:user3 date:[NSDate distantPast] text:NSLocalizedString(@"I just can't believe that bitch bited my yesterday.", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_3 senderDisplayName:user3 date:[NSDate distantPast] text:NSLocalizedString(@"what do you think?", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"I don't know man, I need to go sleep now.", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_3 senderDisplayName:user3 date:[NSDate distantPast] text:NSLocalizedString(@"Good Morning :)", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_3 senderDisplayName:user3 date:[NSDate distantPast] text:NSLocalizedString(@"Are you there?", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_3 senderDisplayName:user3 date:[NSDate distantPast] text:NSLocalizedString(@"Take a stroll?", nil)],
                      nil];
    self.messages4 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"I got somthing wrong with my appetite. I drop 400 grams this month :(", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_4 senderDisplayName:user4 date:[NSDate distantPast] text:NSLocalizedString(@"When will you see the vet?", nil)],
                      nil];
    self.messages5 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_5 senderDisplayName:user5 date:[NSDate distantPast] text:NSLocalizedString(@"Haven't met you for a wile, you remember me?", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"Yes, I do, but I currently live in the other city, with my grandpa.", nil)],
                      nil];
    self.messages6 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"3 pm @ Lavis Park?", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_6 senderDisplayName:user6 date:[NSDate distantPast] text:NSLocalizedString(@"Yes, see you @3 pm", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"How's goin?", nil)],
                      nil];
    self.messages7 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_7 senderDisplayName:user7 date:[NSDate distantPast] text:NSLocalizedString(@"Sorry, I have been busy lately. untimely reply.", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"That's okay, bro. you okay?", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_7 senderDisplayName:user7 date:[NSDate distantPast] text:NSLocalizedString(@"fine.", nil)],
                      nil];
    self.messages8 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_8 senderDisplayName:user8 date:[NSDate distantPast] text:NSLocalizedString(@"you see.", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_8 senderDisplayName:user8 date:[NSDate distantPast] text:NSLocalizedString(@"I saw you on the news.", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_8 senderDisplayName:user8 date:[NSDate distantPast] text:NSLocalizedString(@"is that you?", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_8 senderDisplayName:user8 date:[NSDate distantPast] text:NSLocalizedString(@"http://goo.gl/G33RUR", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"I don't know man, I need to go sleep now.", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_8 senderDisplayName:user8 date:[NSDate distantPast] text:NSLocalizedString(@"bye.", nil)],
                      nil];
    self.messages9 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_9 senderDisplayName:user9 date:[NSDate distantPast] text:NSLocalizedString(@"Thank you for the ride.", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"No problem, I was passing by.", nil)],
                      nil];
    self.messages10 = [[NSMutableArray alloc] initWithObjects:
                      [[JSQMessage alloc] initWithSenderId:userId_10 senderDisplayName:user10 date:[NSDate distantPast] text:NSLocalizedString(@"Sweety, I'm Reggie, Nice to see you", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"Hihi, how are you", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_10 senderDisplayName:user10 date:[NSDate distantPast] text:NSLocalizedString(@"Coun't be better. you looks so sexy, babe", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_10 senderDisplayName:user10 date:[NSDate distantPast] text:NSLocalizedString(@"can we be friends?", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"sure :)", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_10 senderDisplayName:user10 date:[NSDate distantPast] text:NSLocalizedString(@"wanna have fun?", nil)],
                      [[JSQMessage alloc] initWithSenderId:OwnerId senderDisplayName:Owner date:[NSDate distantPast] text:NSLocalizedString(@"Oui", nil)],
                      [[JSQMessage alloc] initWithSenderId:userId_10 senderDisplayName:user10 date:[NSDate distantPast] text:NSLocalizedString(@"Good.", nil)],
                      nil];
    
    //[self addPhotoMediaMessage];
    //[self addAudioMediaMessage];
}

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion
{
    CLLocation *ferryBuildingInSF = [[CLLocation alloc] initWithLatitude:37.795313 longitude:-122.393757];

    JSQLocationMediaItem *locationItem = [[JSQLocationMediaItem alloc] init];
    [locationItem setLocation:ferryBuildingInSF withCompletionHandler:completion];

    JSQMessage *locationMessage = [JSQMessage messageWithSenderId:OwnerId
                                                      displayName:Owner
                                                            media:locationItem];
    [self.messages addObject:locationMessage];
}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"scenery.jpg"]];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:OwnerId
                                                   displayName:Owner
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

- (void)addVideoMediaMessage
{
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    JSQVideoMediaItem *videoItem = [[JSQVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES];
    JSQMessage *videoMessage = [JSQMessage messageWithSenderId:OwnerId
                                                   displayName:Owner
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}

- (void)addAudioMediaMessage
{
    NSString * sample = [NSString stringWithFormat:@"%@/CAT_SoundEffect.m4a", [[NSBundle mainBundle] resourcePath]];
    NSData * audioData = [NSData dataWithContentsOfFile:sample];
    JSQAudioMediaItem *audioItem = [[JSQAudioMediaItem alloc] initWithData:audioData];
    JSQMessage *audioMessage = [JSQMessage messageWithSenderId:OwnerId
                                                   displayName:Owner
                                                         media:audioItem];
    [self.messages addObject:audioMessage];
}

@end
