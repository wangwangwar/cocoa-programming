//
//  StretchView.m
//  DrawingFun
//
//  Created by wangwangwar on 15/7/21.
//
//

#import "StretchView.h"

@implementation StretchView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
}

@end
