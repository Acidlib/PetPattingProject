//
//  ViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/10/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"
#import "SWRevealViewController.h"
#import "ProfileViewController.h"
#import "CustomCell.h"
#import "ChatCell.h"

typedef NS_ENUM(NSInteger, viewType) {
    viewTypeMain = 0,
    viewTypeFav,
    viewTypeMsg
};

@interface ViewController () <UITextFieldDelegate>
{
    NSArray *arrayOfImage;
    NSArray *arrayOfDescription;
    NSArray *arrayOfAge;
    NSArray *arrayOfDistance;
    NSArray *arrayOfFavProfilePic;
    NSArray *arrayOfFavProfileName;
    NSArray *arrayOfFavOnlineStatus;
    NSArray *arrayOfChatImage;
    NSArray *arrayOfUserName;
    NSArray *arrayOfChatContent;
    NSArray *arrayOfChatTime;
    NSArray *arrayOfChatCloud;
}

@property (nonatomic) viewType viewType;

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    _viewType = viewTypeMain;
    [super viewDidLoad];
    [self setupUIAttribute];
    [self setupMainCollectionView];
    [self setupFavCollectionView];
    [self setupMsgCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupUIAttribute
{
    _messageCollectionView.hidden = YES;
    
    // Hamburger btn
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // items
    _searchItem.tintColor = [PetColor lemonDarkColor];
    _favItem.tintColor = [PetColor darkGrayColor];
    _messageItem.tintColor = [PetColor darkGrayColor];

    // images
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
}

- (void)setupMainCollectionView
{
    arrayOfImage = [[NSArray alloc]initWithObjects:@"Prof_s1.png",@"Prof_s2.png",@"Prof_s3.png",@"Prof_s4.png",
                    @"Prof_s6.png",@"Prof_s7.png",@"Prof_s8.png",@"Prof_s9.png",
                    @"Prof_s10.png",@"Prof_s11.png",@"Prof_s12.png",@"Prof_s13.png",          @"Prof_s14.png",@"Prof_s1.png",@"Prof_s2.png",@"Prof_s3.png",@"Prof_s4.png",
                    @"Prof_s6.png",@"Prof_s7.png",@"Prof_s8.png",@"Prof_s9.png",
                    @"Prof_s10.png",@"Prof_s11.png",@"Prof_s12.png",@"Prof_s13.png",
                    @"Prof_s14.png",nil];
    arrayOfDescription = [[NSArray
                           alloc]initWithObjects:@"E d d i e",@"C h a r l i e",@"E l l i e",@"A n g e l",
                          @"L i l i",@"P u p p y",@"R e g g i e",@"P u p u",
                          @"D o t d o t",@"D u m p l i n g",@"L u L u",@"M a o b a o",
                          @"M e i z a i",@"E d d i e",@"C h a r l i e",@"E l l i e",@"A n g e l",
                          @"L i l i",@"P u p p y",@"R e g g i e",@"P u p u",
                          @"D o t d o t",@"D u m p l i n g",@"L u L u",@"M a o b a o",
                          @"M e i z a i",nil];
    arrayOfAge = [[NSArray alloc]initWithObjects:@"5 years",@"8 years",@"2 years",@"1.5 years",
                  @"3 years",@"4.5 years",@"5 years",@"3 years", @"4 years",@"2.5 years",@"8 years",@"8 years", @"2 years",@"6 years",@"6.5 years",@"2 years",@"3.5 years",
                  @"5 years",@"2.5 years",@"6 years",@"2 years",
                  @"1 years",@"3 years",@"9 years",@"4 years",
                  @"9 year",nil];

    arrayOfDistance = [[NSArray alloc]initWithObjects:@"757 feet away",@"647 feet away",@"757 feet away",@"935 feet away",
                       @"945 feet away",@"965 feet away",@"968 feet away",@"1013 feet away", @"1035 feet away",@"1085 feet away",@"1093 feet away",@"", @"",@"1167 feet away",@"1167 feet away",@"1175 feet away",@"1178 feet away",
                       @"1179 feet away",@"1227 feet away",@"",@"1258 feet away",
                       @"1222 feet away",@"1108 feet away",@"1222 feet away",@"1895 feet away",
                       @"945 feet away",nil];
}

- (void)setupFavCollectionView
{
    arrayOfFavProfilePic = [[NSArray alloc]initWithObjects:@"Prof_s1.png",@"p19.png",@"p20.png",@"Prof_s2.png",@"p25.png",@"Prof_s3.png",@"Prof_s4.png",@"p26.png",@"p27.png",@"p28.png",@"p29.png",@"Prof_s6.png",@"Prof_s7.png",@"p21.png",@"Prof_s8.png",@"p30.png",@"Prof_s9.png",@"Prof_s10.png",@"Prof_s11.png",@"Prof_s12.png",@"Prof_s13.png",@"Prof_s14.png",@"p22.png",@"Prof_s12.png",@"p23.png",@"Prof_s13.png",@"p24.png",nil];
    arrayOfFavOnlineStatus = [[NSArray alloc]initWithObjects:@"offline.png",@"online.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"offline.png",@"online.png",@"online.png",@"online.png",@"online.png",@"offline.png",@"offline.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"online.png",nil];

    arrayOfFavProfileName = [[NSArray alloc]initWithObjects:@"E d d i e",@"C h a r l i e",@"E l l i e",@"A n g e l",                  @"L i l i",@"P u p p y",@"R e g g i e",@"P u p u", @"D o t d o t",@"D u m p l i n g",@"L u L u",@"M a o b a o", @"M e i z a i",@"L u L u",@"M a o b a o", @"M e i z a i",@"T o r o",@"C a r a",@"P o p p y",@"Z a r a",@"K e i t a",@"A m o",@"C o n n i e",@"N i c o l e",@"A l b a",@"F a n n y",@"A n g e l",nil];
}

- (void)setupMsgCollectionView
{
    // Chat Preview
    self.messageCollectionView.dataSource = self;
    self.messageCollectionView.delegate = self;

    arrayOfChatCloud = [[NSArray alloc]initWithObjects:@"1_chat.png",@"1_chat2.png",@"1_chat.png",@"1_chat.png",@"1_chat2.png",@"1_chat2.png",@"1_chat.png",@"1_chat.png",@"1_chat2.png",@"1_chat.png", nil];

    arrayOfChatImage = [[NSArray alloc]initWithObjects:@"Prof_c2.png",@"Prof_c3.png",@"Prof_c4.png",@"Prof_c5.png",@"Prof_c6.png",@"Prof_c7.png",@"Prof_c8.png",@"Prof_c9.png",@"Prof_c10.png",@"Prof_c11.png",nil];
    arrayOfUserName = [[NSArray alloc]initWithObjects:@"T O M",@"J E S S", @"X A V",@"P I P I",@"C O M E I",@"E D D I E",@"L I L I",@"M A O B A O",@"M E I Z A I",@"R E G G I E", nil];
    arrayOfChatContent = [[NSArray alloc]initWithObjects:@"Take a stroll?",@"Hey Pretty, free?",@"Sleepy....zzz",@"When will you see the vet?",@"Yes, I do, but I currently ...",@"How's goin",@"fine.",@"bye.",@"No problem, I was passing by.",@"Good", nil];
    arrayOfChatTime = [[NSArray alloc]initWithObjects:@"2:11 pm",@"2:07 pm",@"1:50 pm",@"10:55 am",@"Tue",@"Mon",@"Jan 3",@"Jan 1",@"12/29/15",@"12/30/15", nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showProfile"])
    {
        NSIndexPath *selectedIndexPath = [self.myCollectionView indexPathsForSelectedItems][0];
        UIImage *img = (_viewType == viewTypeMain) ? [UIImage imageNamed:[arrayOfImage objectAtIndex:selectedIndexPath.item]] : [UIImage imageNamed:[arrayOfFavProfilePic objectAtIndex:selectedIndexPath.item]];
        NSString *name = (_viewType == viewTypeMain) ? [arrayOfDescription objectAtIndex:selectedIndexPath.item] : [arrayOfFavProfileName objectAtIndex:selectedIndexPath.item];
        NSString *age = [arrayOfAge objectAtIndex:selectedIndexPath.item];
        NSString *dist = [arrayOfDistance objectAtIndex:selectedIndexPath.item];
        ProfileViewController *detailViewController = segue.destinationViewController;
        detailViewController.img = img;
        detailViewController.name = name;
        detailViewController.age = age;
        detailViewController.distance = dist;
    }
}

- (void)changeTintColor:(viewType)viewtype
{
    _searchItem.tintColor = (viewtype == viewTypeMain) ? [PetColor lemonDarkColor] : [PetColor darkGrayColor];
    _favItem.tintColor = (viewtype == viewTypeFav) ? [PetColor lemonDarkColor] : [PetColor darkGrayColor];
    _messageItem.tintColor = (viewtype == viewTypeMsg) ? [PetColor lemonDarkColor] : [PetColor darkGrayColor];
}

- (IBAction)favPressed:(id)sender
{
    _viewType = viewTypeFav;
    _myCollectionView.hidden = NO;
    _messageCollectionView.hidden = YES;
    [self changeTintColor:viewTypeFav];
    [_myCollectionView reloadData];
}

- (IBAction)searchPressed:(id)sender
{
    _viewType = viewTypeMain;
    _myCollectionView.hidden = NO;
    _messageCollectionView.hidden = YES;
    [self changeTintColor:viewTypeMain];
    [_myCollectionView reloadData];
}

- (IBAction)messagePressed:(id)sender
{
    _viewType = viewTypeMsg;
    _myCollectionView.hidden = YES;
    _messageCollectionView.hidden = NO;
    [self changeTintColor:viewTypeMsg];
    [_messageCollectionView reloadData];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (_viewType) {
        case viewTypeMain:
            return [arrayOfDescription count];
            break;
        case viewTypeFav:
            return [arrayOfFavProfileName count];
            break;
        case viewTypeMsg:
            return [arrayOfChatTime count];
        default:
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (collectionView == _myCollectionView) {
        CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

        cell.colorLabel.backgroundColor = (_viewType == viewTypeMain) ? [PetColor lemonDarkColor] : [PetColor darkColor];
        cell.colorLabel.alpha = 0.6;
        cell.myImage.image =  (_viewType == viewTypeMain) ? [UIImage imageNamed:[arrayOfImage objectAtIndex:indexPath.item]] : [UIImage imageNamed:[arrayOfFavProfilePic objectAtIndex:indexPath.item]];
        cell.myDescriptionLabel.text = (_viewType == viewTypeMain) ? [arrayOfDescription objectAtIndex:indexPath.item] : [arrayOfFavProfileName objectAtIndex:indexPath.item];
        cell.myDescriptionLabel.textColor = (_viewType == viewTypeMain) ? [PetColor darkColor] : [UIColor whiteColor];
        cell.onlineStatus.image = (_viewType == viewTypeMain) ? nil : [UIImage imageNamed:[arrayOfFavOnlineStatus objectAtIndex:indexPath.item]];
        return cell;
    } else {
        ChatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Chat_Cell" forIndexPath:indexPath];

        [[cell chatProfileName]setText:[arrayOfUserName objectAtIndex:indexPath.item]];
        [[cell chatContent]setText:[arrayOfChatContent objectAtIndex:indexPath.item]];
        [[cell chatTime]setText:[arrayOfChatTime objectAtIndex:indexPath.item]];
        // add multiple images
        cell.imageViewTest1.image = [UIImage imageNamed:[arrayOfChatCloud objectAtIndex:indexPath.item]];
        cell.imageViewTest2.image = [UIImage imageNamed:[arrayOfChatImage objectAtIndex:indexPath.item]];
        [cell setTag:indexPath.row];
        return cell;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
