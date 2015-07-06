//
//  RandomController.m
//  Random
//
//  Created by wangwangwar on 15/7/3.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import "RandomController.h"

@implementation RandomController

- (void)awakeFromNib {
    NSDate *now = [NSDate date];
    [self.textField setObjectValue:now];
}

- (IBAction)generate:(id)sender {
    int generated;
    generated = (int)(random() % 100) + 1;
    NSLog(@"generated = %d\n", generated);
    [self.textField setIntValue:generated];
}

- (IBAction)seed:(id)sender {
    srandom((unsigned)time(NULL));
    [self.textField setStringValue:@"Generator seeded"];
}

@end
