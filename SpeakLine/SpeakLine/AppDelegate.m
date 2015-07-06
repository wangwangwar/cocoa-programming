//
//  AppDelegate.m
//  SpeakLine
//
//  Created by wangwangwar on 15/7/6.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (strong) NSSpeechSynthesizer *speechSynth;

@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init");
        
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)sayIt:(id)sender {
    NSString *text = [self.textField stringValue];
    [self.speechSynth startSpeakingString:text];
    NSLog(@"Have started to say: %@", text);
}


- (IBAction)stopIt:(id)sender {
    [self.speechSynth stopSpeaking];
    NSLog(@"Have stopped");
}

@end
