//
//  InfomationViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "InfomationViewController.h"
#import "SWRevealViewController.h"
#import "InfoCollectionViewCell.h"

@interface InfomationViewController ()

@end

@implementation InfomationViewController
{
    NSArray *arrayOfInfoImage;
}
static NSString * const reuseIdentifier1 = @"InfoCell";

- (void)viewDidLoad {

    //Hamburger btn
    [super viewDidLoad];
    _backButtonOfInfo.target = self.revealViewController;
    _backButtonOfInfo.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // images
    [[self infoCollectionView]setDataSource:self];
    [[self infoCollectionView]setDelegate:self];

    // array
    arrayOfInfoImage = [[NSArray alloc]initWithObjects:@"sasa2.png",@"sasa3.png", nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [arrayOfInfoImage count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    InfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier1 forIndexPath:indexPath];
    [[cell sasaImage]setImage:[UIImage imageNamed:[arrayOfInfoImage objectAtIndex:indexPath.item]]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
