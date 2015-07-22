//
//  DragDropView.h
//  DragDropView
//
//  Created by wangwangwar on 15/7/22.
//
//

#import <Cocoa/Cocoa.h>

@protocol DragDropViewDelegate<NSObject>

- (void)dragDropViewFileList:(NSArray*)fileList;

@end

@interface DragDropView : NSView

@property(assign) IBOutlet id<DragDropViewDelegate> delegate;

@end
