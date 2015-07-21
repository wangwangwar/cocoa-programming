//
//  AppDelegate.m
//  DrawingFun
//
//  Created by wangwangwar on 15/7/21.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[self stretchView] setNeedsDisplay:YES];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
