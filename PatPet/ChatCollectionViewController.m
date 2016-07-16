//
//  ChatCollectionViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/15/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ChatCollectionViewController.h"
#import "ChatCell.h"

@interface ChatCollectionViewController ()
{
    NSArray *arrayOfChatImage;
    NSArray *arrayOfUserName;
    NSArray *arrayOfChatContent;
    NSArray *arrayOfChatTime;
    NSArray *arrayOfChatCloud;
}
@end

@implementation ChatCollectionViewController

static NSString * const reuseIdentifier = @"Chat_Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Chat Preview
    [[self chatCollectionView]setDataSource:self];
    [[self chatCollectionView]setDelegate:self];

    arrayOfChatCloud = [[NSArray alloc]initWithObjects:@"1_chat.png",@"1_chat2.png",@"1_chat.png",@"1_chat.png",@"1_chat2.png",@"1_chat2.png",@"1_chat.png",@"1_chat.png",@"1_chat2.png",@"1_chat.png", nil];

    arrayOfChatImage = [[NSArray alloc]initWithObjects:@"Prof_c2.png",@"Prof_c3.png",@"Prof_c4.png",@"Prof_c5.png",@"Prof_c6.png",@"Prof_c7.png",@"Prof_c8.png",@"Prof_c9.png",@"Prof_c10.png",@"Prof_c11.png",nil];
    arrayOfUserName = [[NSArray alloc]initWithObjects:@"T O M",@"J E S S", @"X A V",@"P I P I",@"C O M E I",@"E D D I E",@"L I L I",@"M A O B A O",@"M E I Z A I",@"R E G G I E", nil];
    arrayOfChatContent = [[NSArray alloc]initWithObjects:@"Take a stroll?",@"Hey Pretty, free?",@"Sleepy....zzz",@"When will you see the vet?",@"Yes, I do, but I currently ...",@"How's goin",@"fine.",@"bye.",@"No problem, I was passing by.",@"Good", nil];
    arrayOfChatTime = [[NSArray alloc]initWithObjects:@"2:11 pm",@"2:07 pm",@"1:50 pm",@"10:55 am",@"Tue",@"Mon",@"Jan 3",@"Jan 1",@"12/29/15",@"12/30/15", nil];

}

-(IBAction)done:(id)sender{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [arrayOfChatTime count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ChatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    [[cell chatProfileName]setText:[arrayOfUserName objectAtIndex:indexPath.item]];
    [[cell chatContent]setText:[arrayOfChatContent objectAtIndex:indexPath.item]];
    [[cell chatTime]setText:[arrayOfChatTime objectAtIndex:indexPath.item]];


    // add multiple images
    cell.imageViewTest1.image = [UIImage imageNamed:[arrayOfChatCloud objectAtIndex:indexPath.item]];
    cell.imageViewTest2.image = [UIImage imageNamed:[arrayOfChatImage objectAtIndex:indexPath.item]];

    [cell setTag:indexPath.row];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
