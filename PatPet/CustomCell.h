//
//  CustomCell.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/11/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myDescriptionLabel;

@end
