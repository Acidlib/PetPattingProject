//
//  ChatCell.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/15/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //add
    {

        imageViewTest1 = [[UIImageView alloc] init];
        imageViewTest2 = [[UIImageView alloc]init];
        [self addSubview:imageViewTest1]; //
        [self addSubview:imageViewTest2];
    }
    if(self){
        //initialization code
    }
    return self;
}

@end
