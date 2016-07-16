//
//  ChatCell.h
//  PatPet
//
//  Created by Yi-Ling Wu on 1/15/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCell : UICollectionViewCell
{
    UIImageView *imageViewTest1;
    UIImageView *imageViewTest2;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageViewTest1;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewTest2;

@property (weak, nonatomic) IBOutlet UILabel *chatProfileName;
@property (weak, nonatomic) IBOutlet UILabel *chatContent;
@property (weak, nonatomic) IBOutlet UILabel *chatTime;

@end
