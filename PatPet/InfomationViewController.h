//
//  InfomationViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfomationViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonOfInfo;

@property (weak, nonatomic) IBOutlet UICollectionView *infoCollectionView;

@end
