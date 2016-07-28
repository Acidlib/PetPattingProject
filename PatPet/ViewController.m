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
#include <stdlib.h>

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

    // collectionView
    self.demoData = [[MainModelData alloc] init];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == _myCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat len = (self.view.frame.size.width - 3 * 15)/3 - 5;
        layout.itemSize = CGSizeMake(len, len);
        return layout.itemSize;
    } else {
        NSInteger itemCountInRow = 1;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        CGFloat length = (self.view.frame.size.width - 2 * 5);
        layout.itemSize = CGSizeMake(length, 105);
        return layout.itemSize;
    }
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
            return self.demoData.searchList.count;
            break;
        case viewTypeFav:
            return self.demoData.favoriteList.count;
            break;
        case viewTypeMsg:
            return [arrayOfChatTime count];
        default:
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = (_viewType == viewTypeMain) ? [self.demoData.searchList[indexPath.item] integerValue] : [self.demoData.favoriteList[indexPath.item] integerValue];
    int randNum = rand() % (2 - 1) + 1;
    int r = arc4random_uniform(2);
    if (collectionView == _myCollectionView) {
        CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.colorLabel.backgroundColor = (_viewType == viewTypeMain) ? [PetColor lemonDarkColor] : [PetColor darkColor];
        cell.colorLabel.alpha = 0.6;
        cell.myImage.image = [UIImage imageNamed:[self.demoData.featuresAttrib_fileName objectAtIndex:index]];
        cell.myDescriptionLabel.text = self.demoData.featuresAttrib_nickName[index];
        cell.myDescriptionLabel.textColor = (_viewType == viewTypeMain) ? [PetColor darkColor] : [UIColor whiteColor];
        cell.onlineStatus.image = (_viewType == viewTypeMain) ? nil : (r == 0) ? [UIImage imageNamed:@"offline.png"] : [UIImage imageNamed:@"online.png"];
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
