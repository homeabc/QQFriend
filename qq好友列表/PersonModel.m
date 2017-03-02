//
//  PersonModel.m
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel



-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friednWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}



@end
