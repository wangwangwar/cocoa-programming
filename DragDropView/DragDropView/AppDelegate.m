//
//  AppDelegate.m
//  DragDropView
//
//  Created by wangwangwar on 15/7/22.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)dragDropViewFileList:(NSArray *)fileList {
    for (NSString *file in fileList) {
        NSLog(@">>> %@\n", file);
    }
}

@end
