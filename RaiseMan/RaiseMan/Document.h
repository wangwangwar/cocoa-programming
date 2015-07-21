//
//  Document.h
//  RaiseMan
//
//  Created by wangwangwar on 15/7/19.
//  Copyright (c) 2015年 Sunbird. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Person;

@interface Document : NSDocument

@property(nonatomic, strong) NSMutableArray *employees;

- (void)insertObject:(Person *)object inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;

@end
