//
//  MyHeadView.h
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupModel;
@class MyHeadView;

@protocol MyHeadViewDelegate <NSObject>

- (void)headViewDidClickTitleButton:(MyHeadView *)headView;


@end

@interface MyHeadView : UITableViewHeaderFooterView


+ (instancetype)headerViewWithTableView:(UITableView *)tableview;


@property (strong, nonatomic) GroupModel *models;

@property (weak, nonatomic) id<MyHeadViewDelegate> delegate;


@end
