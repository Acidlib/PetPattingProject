////
////  ProfileFavViewController.m
////  PatPet
////
////  Created by Yi-Ling Wu on 1/23/16.
////  Copyright © 2016 Yi-Ling Wu. All rights reserved.
////
//
//#import "ProfileFavViewController.h"
//#import <AudioToolbox/AudioServices.h>
//#import <AVFoundation/AVAudioPlayer.h>
//
//@interface ProfileFavViewController ()
//
//@property (nonatomic, weak) IBOutlet UIImageView *imageViewFav;
//@property (readwrite) CFURLRef pathURL;
//@property (readonly)  SystemSoundID audioEffect;
//@property (readonly) AVAudioPlayer *audioPlayer;
//
//@end
//
//@implementation ProfileFavViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self setupAttribute];
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.imageViewFav.image = self.myImageFav;
//    self.navigationController.navigationBar.hidden = YES;
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}
//
//- (void)setupAttribute
//{
////    _indication.backgroundColor = [PetColor darkColor];
////    _indication.alpha = 0.8;
////    _myName.font = [UIFont fontWithName:@"Helvetica-light" size:24];
////    _myAge.font = [UIFont fontWithName:@"Helvetica-light" size:14];
////    _myDistance.font = [UIFont fontWithName:@"Helvetica-light" size:14];
////    _myName.textColor = [PetColor lemonDarkColor];
////    _myAge.textColor = [PetColor lemonDarkColor];
////    _myDistance.textColor = [PetColor lemonDarkColor];
//
//    // navigation bar hidden
//    self.navigationController.navigationBar.hidden = YES;
//
//    /*
//     // gradientView
//     [UIView animateWithDuration: 1.0
//     animations: ^{
//     // gradient View
//     // toggle:
//     CAGradientLayer *gradient = [CAGradientLayer layer];
//     gradient.frame = _gradientView.bounds;
//     gradient.colors = [NSArray arrayWithObjects:(id)[[PetColor darkColor]CGColor], (id)[[UIColor clearColor] CGColor], nil];
//     [_gradientView.layer insertSublayer:gradient below:_backButton.layer];
//     _gradientView.alpha = _gradientView.alpha == 1.0 ? 0.0 : 1.0;
//     }];*/
//
//    // backPressed
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(zap:)];
//    self.navigationItem.leftBarButtonItem = left;
//
//    //The setup code (in viewDidLoad in your view controller)
//    UITapGestureRecognizer *singleFingerTap =
//    [[UITapGestureRecognizer alloc] initWithTarget:self
//                                            action:@selector(handleSingleTap:)];
//    [self.view addGestureRecognizer:singleFingerTap];
//
//    // Voice
//    NSString *path = [NSString stringWithFormat:@"%@/CAT_SoundEffect.m4a", [[NSBundle mainBundle] resourcePath]];
//    NSURL *soundUrl = [NSURL fileURLWithPath:path];
//    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    [_audioPlayer play];
//}
//
//-(void)zap:(UIBarButtonItem *)sender
//{
//    [self.navigationController popViewControllerAnimated:NO];
//}
//
//- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
//{
//    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
//
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//- (IBAction)backPressed:(id)sender
//{
//    [self.navigationController popToRootViewControllerAnimated:NO];
//}
//
//@end
