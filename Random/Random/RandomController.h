//
//  RandomController.h
//  Random
//
//  Created by wangwangwar on 15/7/3.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface RandomController : NSObject

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;

@end
