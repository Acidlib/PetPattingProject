//
//  ViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/10/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *View0;
@property (weak, nonatomic) IBOutlet UIView *View1;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *messageItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchItem;

@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@end

