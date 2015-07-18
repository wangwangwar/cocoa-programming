//
//  AppDelegate.m
//  SpeakLine
//
//  Created by wangwangwar on 15/7/6.
//  Copyright (c) 2015年 wangwangwar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@property(weak) IBOutlet NSTextField *textField;
@property(strong) NSSpeechSynthesizer *speechSynth;
@property(weak) IBOutlet NSButton *stopButton;
@property(weak) IBOutlet NSButton *speakButton;

@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init");

        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];
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
    [self.stopButton setEnabled:TRUE];
    [self.speakButton setEnabled:FALSE];

    NSLog(@"Have started to say: %@", text);
}

- (IBAction)stopIt:(id)sender {
    [self.speechSynth stopSpeaking];
    NSLog(@"Have stopped");
}

#pragma mark - NSSpeechSynthesizerDelegate

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking {
    [self.stopButton setEnabled:FALSE];
    [self.speakButton setEnabled:TRUE];

    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
}

@end
