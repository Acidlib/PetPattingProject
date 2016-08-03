//
//  ProfileViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/22/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ProfileViewController.h"
#import "MessageViewController.h"
#import "PetColor.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ProfileViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *myName;
@property (nonatomic, weak) IBOutlet UILabel *myAge;
@property (nonatomic, weak) IBOutlet UILabel *myDistance;
@property (weak, nonatomic) IBOutlet UIImageView *likeImage;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

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
    _likeButton.hidden = YES;
    _likeImage.hidden = YES;
    _indication.backgroundColor = [PetColor darkColor];
    _indication.alpha = 0.8;
    _myName.font = [UIFont fontWithName:@"Helvetica-bold" size:15];
    _myAge.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    _myDistance.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    _myName.textColor = [PetColor lemonDarkColor];
    _myAge.textColor = [PetColor lemonDarkColor];
    _myDistance.textColor = [PetColor lemonDarkColor];

    // navigation bar hidden
    self.navigationController.navigationBar.hidden = YES;

    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];

    // Voice
    NSString *path = self.species ? [NSString stringWithFormat:@"%@/CAT_SoundEffect.m4a", [[NSBundle mainBundle] resourcePath]] : [NSString stringWithFormat:@"%@/Dog_SoundEffect.m4a", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    [UIView transitionWithView:_likeImage
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _likeImage.hidden = NO;
                    }
                    completion:^(BOOL finished){
                        if (finished) {
                            [UIView transitionWithView:_likeImage
                                              duration:0.4
                                               options:UIViewAnimationOptionTransitionCrossDissolve
                                            animations:^{
                                                _likeImage.hidden = YES;
                                                _likeButton.hidden = NO;
                                            } completion:nil];
                        }
                    }];
}

- (IBAction)didTapLike:(id)sender
{
    _likeButton.hidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMessage"]) {
        MessageViewController *msgVC = segue.destinationViewController.childViewControllers[0];
        msgVC.name = self.name;
        msgVC.msgSource = messageFromAnyProfile;
    }
}

- (IBAction)messagePressed:(id)sender
{

}

- (IBAction)backPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}


- (void) playMySoundLikeRightNowReally {
    AudioServicesPlaySystemSound(audioEffect);
}

@end
