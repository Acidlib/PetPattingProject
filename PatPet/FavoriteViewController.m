////
////  FavoriteViewController.m
////  PatPet
////
////  Created by Yi-Ling Wu on 1/13/16.
////  Copyright © 2016 Yi-Ling Wu. All rights reserved.
////
//
//#import "FavoriteViewController.h"
//#import "ProfileFavViewController.h"
//#import "FavCell.h"
//#import "PetColor.h"
//
//@interface FavoriteViewController ()<UITextFieldDelegate>
//{
//    NSArray *arrayOfFavProfilePic;
//    NSArray *arrayOfFavProfileName;
//    NSArray *arrayOfFavOnlineStatus;
//}
//
//@end
//
//@implementation FavoriteViewController
//
//static NSString * const reuseIdentifier = @"FavCell";
//static NSString *kDetailedViewControllerID = @"DetailProfile2";    // view
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self setupUIAttribute];
//    [self setupCollectionView];
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}
////- (void)viewWillAppear:(BOOL)animated
////{
////    [super viewWillAppear:animated];
////    self.navigationController.navigationBar.hidden = NO;
////}
//
//- (void)setupUIAttribute
//{
//    //
//}
//
//- (void)setupCollectionView
//{
//    // Fav Collection View
//    [[self FavCollectionView]setDataSource:self];
//    [[self FavCollectionView]setDelegate:self];
//    arrayOfFavProfilePic = [[NSArray alloc]initWithObjects:@"Prof_s1.png",@"p19.png",@"p20.png",@"Prof_s2.png",@"p25.png",@"Prof_s3.png",@"Prof_s4.png",@"p26.png",@"p27.png",@"p28.png",@"p29.png",@"Prof_s6.png",@"Prof_s7.png",@"p21.png",@"Prof_s8.png",@"p30.png",@"Prof_s9.png",@"Prof_s10.png",@"Prof_s11.png",@"Prof_s12.png",@"Prof_s13.png",@"Prof_s14.png",@"p22.png",@"Prof_s12.png",@"p23.png",@"Prof_s13.png",@"p24.png",nil];
//    arrayOfFavOnlineStatus = [[NSArray alloc]initWithObjects:@"offline.png",@"online.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"offline.png",@"online.png",@"online.png",@"online.png",@"online.png",@"offline.png",@"offline.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"offline.png",@"online.png",@"offline.png",@"online.png",@"offline.png",@"online.png",nil];
//
//    arrayOfFavProfileName = [[NSArray alloc]initWithObjects:@"E d d i e",@"C h a r l i e",@"E l l i e",@"A n g e l",                  @"L i l i",@"P u p p y",@"R e g g i e",@"P u p u", @"D o t d o t",@"D u m p l i n g",@"L u L u",@"M a o b a o", @"M e i z a i",@"L u L u",@"M a o b a o", @"M e i z a i",@"T o r o",@"C a r a",@"P o p p y",@"Z a r a",@"K e i t a",@"A m o",@"C o n n i e",@"N i c o l e",@"A l b a",@"F a n n y",@"A n g e l",nil];
//}
//
//#pragma mark - collectionViewDelegate
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//
//    return 1;
//}
//
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//
//    return [arrayOfFavProfileName count];
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    FavCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//
//    cell.favProfileName.backgroundColor = [PetColor darkColor];
//    cell.favProfileName.text = [arrayOfFavProfileName objectAtIndexedSubscript:indexPath.item];
//    cell.favProfilePic.image = [UIImage imageNamed:[arrayOfFavProfilePic objectAtIndex:indexPath.item]];
//    cell.favOnlineStatus.image = [UIImage imageNamed:[arrayOfFavOnlineStatus objectAtIndex:indexPath.item]];
//
//    [cell setTag:indexPath.row];
//
//    return cell;
//}
//
//#pragma mark Show detail Profile
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"showProfile2"])
//    {
//        NSIndexPath *selectedIndexPath = [self.FavCollectionView indexPathsForSelectedItems][0];
//        UIImage *myImage = [UIImage imageNamed:[arrayOfFavProfilePic objectAtIndex:selectedIndexPath.item]];
//        ProfileFavViewController *detailViewController = segue.destinationViewController;
//        detailViewController.myImageFav = myImage;
//        
//    }
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(IBAction)done:(id)sender{
//    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
//}
//
//@end
