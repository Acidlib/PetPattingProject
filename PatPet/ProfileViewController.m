//
//  ProfileViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/22/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ProfileViewController.h"
#import "PetColor.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ProfileViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *myName;
@property (nonatomic, weak) IBOutlet UILabel *myAge;
@property (nonatomic, weak) IBOutlet UILabel *myDistance;

@property (readwrite) CFURLRef pathURL;
@property (readonly)  SystemSoundID audioEffect;
@property (readonly) AVAudioPlayer *audioPlayer;

@end

@implementation ProfileViewController

@synthesize pathURL;
@synthesize audioEffect;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAttribute];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _imageView.image = self.img;
    _myName.text = self.name;
    _myAge.text = self.age;
    _myDistance.text = self.distance;
}

- (void)setupAttribute
{
    _indication.backgroundColor = [PetColor darkColor];
    _indication.alpha = 0.8;
    _myName.font = [UIFont fontWithName:@"Helvetica-light" size:24];
    _myAge.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    _myDistance.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    _myName.textColor = [PetColor lemonDarkColor];
    _myAge.textColor = [PetColor lemonDarkColor];
    _myDistance.textColor = [PetColor lemonDarkColor];

    // backPressed
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(zap:)];
    self.navigationItem.leftBarButtonItem = left;

    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];

    // Voice
    NSString *path = [NSString stringWithFormat:@"%@/CAT_SoundEffect.m4a", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
}

-(void)zap:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];

    //Do stuff here...
}

- (void) playMySoundLikeRightNowReally {
    AudioServicesPlaySystemSound(audioEffect);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
