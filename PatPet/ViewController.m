//
//  ViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/10/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"

@interface ViewController ()
{
    NSArray *arrayOfImage;
    NSArray *arrayOfDescription;
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
                   @"Prof_s10.png",@"Prof_s11.png",@"Prof_s12.png",@"Prof_s13.png",
                   @"Prof_s14.png",nil];
    arrayOfDescription = [[NSArray
        alloc]initWithObjects:@"E d d i e",@"C h a r l i e",@"E l l i e",@"A n g e l",
                          @"L i l i",@"P u p p y",@"R e g g i e",@"P u p u",
                          @"D o t d o t",@"D u m p l i n g",@"L u L u",@"M a o b a o",
                          @"M e i z a i",nil];
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
