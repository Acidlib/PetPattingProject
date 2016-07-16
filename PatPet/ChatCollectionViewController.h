//
//  ChatCollectionViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/15/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *chatCollectionView;

-(IBAction)done:(id)sender;

@end
