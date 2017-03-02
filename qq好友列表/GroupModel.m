//
//  GroupModel.m
//  qq好友列表
//
//  Created by 洪福清 on 2016/12/13.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "GroupModel.h"
#import "PersonModel.h"

@implementation GroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        //把self。 friend 有字典数组转换为模型数据
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *tempDict in self.friedns) {
            PersonModel *models = [PersonModel friednWithDict:tempDict];
            [arrayModels addObject:models];
        }
        self.friedns = arrayModels;
        
    }
    return self;
}


+(instancetype)GroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
