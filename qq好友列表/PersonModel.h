//
//  PersonModel.h
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject


@property (copy, nonatomic) NSString *icon;

@property (copy, nonatomic) NSString *name;

@property (assign, nonatomic, getter=isVip) BOOL vip;



-(instancetype)initWithDict:(NSDictionary *)dict;


+(instancetype)friednWithDict:(NSDictionary *)dict;

@end
