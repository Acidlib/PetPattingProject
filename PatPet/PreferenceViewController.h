//
//  PreferenceViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;
@interface PreferenceViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonOfPref;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIImageView *catTypeImage;

@property(copy, nonatomic) NSArray *prefType;
@property(copy, nonatomic) NSArray *detailType;

@end
