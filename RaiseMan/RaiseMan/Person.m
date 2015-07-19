//
//  Person.m
//  RaiseMan
//
//  Created by wangwangwar on 15/7/19.
//  Copyright (c) 2015年 Sunbird. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    self = [super init];
    if (self) {
        _expectedRaise = 0.05;
        _personName = @"New Person";
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqual:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

@end
