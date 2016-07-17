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

@interface ViewController () <UITextFieldDelegate>
{
    NSArray *arrayOfImage;
    NSArray *arrayOfDescription;
    NSArray *arrayOfAge;
    NSArray *arrayOfDistance;
}
@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Hamburger btn
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // images
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showProfile"])
    {
        NSIndexPath *selectedIndexPath = [self.myCollectionView indexPathsForSelectedItems][0];
        UIImage *img = [UIImage imageNamed:[arrayOfImage objectAtIndex:selectedIndexPath.item]];
        NSString *name = [arrayOfDescription objectAtIndex:selectedIndexPath.item];
        NSString *age = [arrayOfAge objectAtIndex:selectedIndexPath.item];
        NSString *dist = [arrayOfDistance objectAtIndex:selectedIndexPath.item];
        ProfileViewController *detailViewController = segue.destinationViewController;
        detailViewController.img = img;
        detailViewController.name = name;
        detailViewController.age = age;
        detailViewController.distance = dist;
    }
}

- (IBAction)backgroundPressed:(id)sender {
    [_searchField endEditing:YES];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [arrayOfDescription count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    [[cell myImage]setImage:[UIImage imageNamed:
                             [arrayOfImage objectAtIndex:indexPath.item]]];
    [[cell myDescriptionLabel]setText:[arrayOfDescription objectAtIndex:indexPath.item]];


    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
