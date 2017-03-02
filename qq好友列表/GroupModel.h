//
//  GroupModel.h
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject


@property (copy, nonatomic) NSString *name;

@property (assign,nonatomic) int online;

@property (strong, nonatomic) NSArray *friedns;

//表示这个组是否可见
@property (assign, nonatomic, getter=isVisible) BOOL visiable;



-(instancetype)initWithDict:(NSDictionary *)dict;


+(instancetype)GroupWithDict:(NSDictionary *)dict;
@end
