//
//  AppDelegate.m
//  CountCharacters
//
//  Created by wangwangwar on 15/7/6.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *label;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)count:(id)sender {
    [self.label setStringValue:[NSString stringWithFormat:@"'%@' has %ld characters.",
                                self.textField.stringValue,
                                [self.textField.stringValue length]]];
}

@end
