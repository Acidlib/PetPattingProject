//
//  FavoriteViewController.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/13/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface FavoriteViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *favBackButton;

@property (weak, nonatomic) IBOutlet UICollectionView *FavCollectionView;

-(IBAction)done:(id)sender;

@end
