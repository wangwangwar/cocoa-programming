//
//  StretchView.m
//  DrawingFun
//
//  Created by wangwangwar on 15/7/21.
//
//

#import "StretchView.h"

@implementation StretchView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Seed the random number generator
        srandom((unsigned)time(NULL));

        // Create a path object
        _path = [NSBezierPath bezierPath];
        [_path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [_path moveToPoint:p];
        for (int i = 0; i < 15; i++) {
            p = [self randomPoint];
            [_path lineToPoint:p];
        }
        [_path closePath];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        // Seed the random number generator
        srandom((unsigned)time(NULL));

        // Create a path object
        _path = [NSBezierPath bezierPath];
        [_path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [_path moveToPoint:p];
        for (int i = 0; i < 15; i++) {
            p = [self randomPoint];
            [_path lineToPoint:p];
        }
        [_path closePath];
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];

    [[NSColor whiteColor] set];
    [[self path] stroke];
}

- (NSPoint)randomPoint {
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}

@end
