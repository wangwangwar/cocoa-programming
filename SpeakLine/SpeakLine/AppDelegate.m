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
@property(weak) IBOutlet NSButton *stopButton;
@property(weak) IBOutlet NSButton *speakButton;
@property(weak) IBOutlet NSTableView *tableView;
@property(strong) NSSpeechSynthesizer *speechSynth;
@property(strong) NSArray *voices;

@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init");

        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];

        _voices = [NSSpeechSynthesizer availableVoices];
    }

    return self;
}

- (void)awakeFromNib {
    // When the table view appears on screen, the default voice should be selected
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [self.voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [self.tableView selectRowIndexes:indices byExtendingSelection:NO];
    [self.tableView scrollRowToVisible:defaultRow];
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

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.voices count];
}

- (id)tableView:(NSTableView *)tableView
    objectValueForTableColumn:(NSTableColumn *)tableColumn
                          row:(NSInteger)row {
    NSString *v = [self.voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    return dict[NSVoiceName];
}

#pragma mark - NSTableViewDelegate

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = [self.tableView selectedRow];
    if (row == -1) {
        return;
    }

    NSString *selectedVoice = [self.voices objectAtIndex:row];
    [self.speechSynth setVoice:selectedVoice];

    NSLog(@"new voice = %@", selectedVoice);
}

@end
