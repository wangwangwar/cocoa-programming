//
//  StretchView.h
//  DrawingFun
//
//  Created by wangwangwar on 15/7/21.
//
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView

@property(nonatomic, strong) NSBezierPath *path;

- (NSPoint)randomPoint;

@end
