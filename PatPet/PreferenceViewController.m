//
//  PreferenceViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "PreferenceViewController.h"
#import "SWRevealViewController.h"
#import "BreedsCell.h"
#import "PetColor.h"

#define VIEW_HEIGHT (self.view.frame.size.height - 65)
#define VIEW_WIDTH self.view.frame.size.width

@interface PreferenceViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UIView *line;

@end

@implementation PreferenceViewController
{
    NSArray *arrayOfBreedsImage;
    NSArray *arrayOfBreedsDescription;
}
static NSString * const reuseIdentifier = @"BreedsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIAttribute];
    // Hamburger btn
    _backButtonOfPref.target = self.revealViewController;
    _backButtonOfPref.action = @selector(revealToggle:);
    //[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // disable panGesture of SWReveal
    SWRevealViewController *reveal = self.revealViewController;
    reveal.panGestureRecognizer.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)setupUIAttribute
{
    // GIF
    _catTypeImage.image = [UIImage animatedImageNamed:@"icn-fur-y-" duration:1.0f];

    // Bounce
    _scrollView.bounces = NO;
    _scrollView.scrollEnabled = NO;
}

- (IBAction)continuePressed:(id)sender
{
    CGRect frame = CGRectMake(0, VIEW_HEIGHT, VIEW_WIDTH, VIEW_HEIGHT);
    [self.scrollView scrollRectToVisible:frame animated:YES];
    [self setupAttributeSexualPreference];

}

- (void)setupAttributeSexualPreference
{
    // Title
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 260)/2, VIEW_HEIGHT + 15, 260, 70)];
    titleLabel.text = @"Sexual Preference";;
    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.minimumScaleFactor = 10.0f/12.0f;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    [self.scrollView addSubview:titleLabel];

    // Subtitle
    UILabel *subTitle = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 240)/2, VIEW_HEIGHT + 90, 240, 50)];
    subTitle.text = @"Please select your sexual preference(s)";;
    subTitle.font = [UIFont fontWithName:@"Helvetica" size:16];
    subTitle.numberOfLines = 2;
    subTitle.textAlignment = NSTextAlignmentCenter;
    subTitle.adjustsFontSizeToFitWidth = YES;
    subTitle.backgroundColor = [UIColor clearColor];
    subTitle.textColor = [UIColor blackColor];
    [self.scrollView addSubview:subTitle];

    // Image
    UIImageView *gender1 = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 40*3 - 35*2)/2, VIEW_HEIGHT + 90 + 100, 40, 40)];
    UIImageView *gender2 = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 40*3 - 35*2)/2 + 75, VIEW_HEIGHT + 90 + 100, 40, 40)];
    UIImageView *gender3 = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 40*3 - 35*2)/2 + 75 * 2, VIEW_HEIGHT + 90 + 100, 40, 40)];
    gender1.image = [UIImage imageNamed:@"icn_female"];
    gender2.image = [UIImage imageNamed:@"icn_genderOthers"];
    gender3.image = [UIImage imageNamed:@"icn_male"];
    [self.scrollView addSubview:gender1];
    [self.scrollView addSubview:gender2];
    [self.scrollView addSubview:gender3];

    // slider
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 200)/2, VIEW_HEIGHT + 200+ 70, 200, 10)];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumTrackTintColor = [UIColor lightGrayColor];
    slider.minimumValue = 0.0;
    slider.maximumValue = 50.0;
    slider.continuous = NO;
    slider.value = 25.0;
    [self.scrollView addSubview:slider];

    // scrollDown
    //UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 60)/2, VIEW_HEIGHT + 240 + 100, 60, 60)];
    UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 60)/2, VIEW_HEIGHT * 2 - 80, 50, 50)];
    [next setBackgroundImage:[UIImage imageNamed:@"icn_scrollDown"] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(speciesPreference) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:next];
}

-(void)sliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    //float value = slider.value;
}

- (void)speciesPreference
{
    CGRect frame = CGRectMake(0, (VIEW_HEIGHT) * 2 , VIEW_WIDTH, VIEW_HEIGHT);
    [self.scrollView scrollRectToVisible:frame animated:YES];
    [self setupAttributeSpecies];
}

- (void)setupAttributeSpecies
{
    // Title
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 260)/2, VIEW_HEIGHT * 2 + 15, 260, 70)];
    titleLabel.text = @"Cats or Dogs?";;
    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.minimumScaleFactor = 10.0f/12.0f;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    [self.scrollView addSubview:titleLabel];

    // Subtitle
    UILabel *subTitle = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 240)/2, VIEW_HEIGHT * 2 + 90, 240, 50)];
    subTitle.text = @"Hmmm, you like to make friends with either cats or dogs or you prefer errr.... well";;
    subTitle.font = [UIFont fontWithName:@"Helvetica" size:16];
    subTitle.numberOfLines = 2;
    subTitle.textAlignment = NSTextAlignmentCenter;
    subTitle.adjustsFontSizeToFitWidth = YES;
    subTitle.backgroundColor = [UIColor clearColor];
    subTitle.textColor = [UIColor blackColor];
    [self.scrollView addSubview:subTitle];

    // reset
    UIButton *reset = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 240)/2, VIEW_HEIGHT * 2 + 130, 240, 30)];
    [reset setTitle:@"reset" forState:UIControlStateNormal];
    reset.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    reset.titleLabel.textAlignment = NSTextAlignmentCenter;
    reset.backgroundColor = [UIColor clearColor];
    reset.titleLabel.textColor = [PetColor lemonDarkColor];
    [reset addTarget:self action:@selector(selectReset) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:reset];

    // Imagetton
    UIButton *catButton = [[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 100*2 - 25*1)/2, VIEW_HEIGHT * 2 + 90 + 100, 100, 100)];
    UIButton *dogButton = [[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 100*2 - 25*1)/2 + 115, VIEW_HEIGHT * 2 + 90 + 100, 100, 100)];
    [catButton setBackgroundImage:[UIImage imageNamed:@"icn_cat"] forState:UIControlStateNormal];
    [dogButton setBackgroundImage:[UIImage imageNamed:@"icn_dog"] forState:UIControlStateNormal];
    [catButton addTarget:self action:@selector(selectCat) forControlEvents:UIControlEventTouchUpInside];
    [dogButton addTarget:self action:@selector(selectDog) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:catButton];
    [self.scrollView addSubview:dogButton];

    // line slider
    _line = [[UIView alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 70)/2, VIEW_HEIGHT * 2 + 330, 70, 10)];
    _line.backgroundColor = [PetColor lemonDarkColor];
    _line.alpha = 0.5;
    [self.scrollView addSubview:_line];

    // Text of scrollDown
    UILabel *nextText = [[UILabel alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 60)/2, VIEW_HEIGHT * 3 - 130, 50, 50)];
    nextText.text = @"next";;
    nextText.font = [UIFont fontWithName:@"Helvetica" size:16];
    nextText.textAlignment = NSTextAlignmentCenter;
    nextText.adjustsFontSizeToFitWidth = YES;
    nextText.backgroundColor = [UIColor clearColor];
    nextText.textColor = [PetColor lemonDarkColor];
    [self.scrollView addSubview:nextText];

    // scrollDown
    UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 60)/2, VIEW_HEIGHT * 3 - 80, 50, 50)];
    [next setBackgroundImage:[UIImage imageNamed:@"icn_scrollDown"] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(appearancePreference) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:next];
}

- (void)selectReset
{
    [UIView animateWithDuration:0.3f animations:^{
        [_line setFrame:CGRectMake((VIEW_WIDTH - 70)/2, VIEW_HEIGHT * 2 + 330, 70, 10)];
    } completion:nil];
}

- (void)selectCat
{
    [UIView animateWithDuration:0.3f animations:^{
        [_line setFrame:CGRectMake((VIEW_WIDTH - 100*2 - 25*1 + (100-70)/2) /2, VIEW_HEIGHT * 2 + 330, 70, 10)];
    } completion:nil];

}

- (void)selectDog
{
    [UIView animateWithDuration:0.3f animations:^{
        [_line setFrame:CGRectMake((VIEW_WIDTH - 100*2 - 25*1 + (100-70)/2) /2 + 125, VIEW_HEIGHT * 2 + 330, 70, 10)];
    } completion:nil];

}

- (void)appearancePreference
{
    CGRect frame = CGRectMake(0, (VIEW_HEIGHT) * 3 , VIEW_WIDTH, VIEW_HEIGHT);
    [self.scrollView scrollRectToVisible:frame animated:YES];
    [self setupAttributeAppearance];
}

- (void)setupAttributeAppearance
{

}

@end
