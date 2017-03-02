//
//  MyHeadView.m
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "MyHeadView.h"
#import "GroupModel.h"

@interface MyHeadView ()

@property (strong, nonatomic) UIButton *titleBtn;

@property (strong, nonatomic) UILabel *titleLbales;



@end

@implementation MyHeadView


+(instancetype)headerViewWithTableView:(UITableView *)tableview
{
    static NSString *Id = @"id";
    MyHeadView *headView = [tableview dequeueReusableHeaderFooterViewWithIdentifier:Id];
    if (headView == nil) {
        headView = [[MyHeadView alloc] initWithReuseIdentifier:Id];
    }
    return headView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //创建按钮 label
        [self.contentView addSubview:self.titleBtn];
    
        [self.contentView addSubview:self.titleLbales];
        
        
        //设置按钮的图片
        [self.titleBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        self.contentView.backgroundColor = [UIColor redColor];
        
        
    }
    return self;
}


-(void)setModels:(GroupModel *)models
{
    _models = models;
    
    [self.titleBtn setTitle:models.name forState:UIControlStateNormal];
    
    self.titleLbales.text = [NSString stringWithFormat:@"%d/10",models.online];
    
    
    //设置按钮中的图片旋转问题(重用问题)
    if (self.models.isVisible) {
        self.titleBtn.imageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }
    else{
        self.titleBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

-(UIButton *)titleBtn
{
    if (_titleBtn == nil) {
        _titleBtn = [[UIButton alloc] init];
        [_titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _titleBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _titleBtn.imageView.contentMode = UIViewContentModeCenter;
        //设置图片超出的部分不截取
        _titleBtn.imageView.clipsToBounds = NO;
        
        
    }
    return _titleBtn;
}

-(UILabel *)titleLbales
{
    if (_titleLbales == nil) {
        _titleLbales = [[UILabel alloc] init];
        _titleLbales.textColor =[UIColor blueColor];
    }
    return _titleLbales;
}


//组标题按钮的点击事件
- (void)titleBtnClick
{
    //设置组的状态
    self.models.visiable = !self.models.isVisible;
    
    if ([self.delegate respondsToSelector:@selector(headViewDidClickTitleButton:)]) {
        [self.delegate headViewDidClickTitleButton:self];
    }
    
    
    
}


//当一个新的head view已经加到某个父控江中
-(void)didMoveToSuperview
{
    if (self.models.isVisible) {
        self.titleBtn.imageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }
    else{
        self.titleBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    

}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮的frame
    self.titleBtn.frame = self.bounds;
    
    self.titleLbales.frame = CGRectMake(self.bounds.size.width-110, 0, 100, self.bounds.size.height);
    
}











@end
