//
//  MyTableViewCell.m
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "MyTableViewCell.h"
#import "PersonModel.h"

@interface MyTableViewCell ()

@property (strong, nonatomic) UILabel *mylabels;

@end


@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.mylabels];
    }
    return self;
}


-(void)setModels:(PersonModel *)models
{
    _models = models;
    self.mylabels.text = models.name;
    
}



-(UILabel *)mylabels
{
    if (_mylabels == nil) {
        _mylabels = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        _mylabels.textColor = [UIColor blueColor];
    }
    return _mylabels;
}



@end
