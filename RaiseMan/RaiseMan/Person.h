//
//  Person.h
//  RaiseMan
//
//  Created by wangwangwar on 15/7/19.
//  Copyright (c) 2015年 Sunbird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(readonly, copy) NSString *personName;
@property(readwrite) float expectedRaise;
- (instancetype)init;

@end
