//
//  RandomTests.m
//  RandomTests
//
//  Created by wangwangwar on 15/7/3.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "RandomController.h"

@interface RandomTests : XCTestCase

@end

@implementation RandomTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRandomController {
    RandomController *randomController = [[RandomController alloc] init];
    
    XCTAssert(YES, @"Pass");
}

@end
