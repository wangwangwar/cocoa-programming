//
//  AppDelegate.m
//  iPing
//
//  Created by wangwangwar on 15/7/21.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@property(unsafe_unretained) IBOutlet NSTextView *outputView;
@property(weak) IBOutlet NSTextField *hostField;
@property(weak) IBOutlet NSButton *startButton;
@property(nonatomic, strong) NSTask *task;
@property(nonatomic, strong) NSPipe *pipe;

@end

@implementation AppDelegate

- (IBAction)startStopPing:(id)sender {
    // Is the task running?
    if ([self task]) {
        [[self task] interrupt];
    } else {
        [self setTask:[[NSTask alloc] init]];
        [[self task] setLaunchPath:@"/sbin/ping"];
        NSArray *args = @[ @"-c10", [[self hostField] stringValue] ];
        [[self task] setArguments:args];

        // Create a new pipe
        [self setPipe:[[NSPipe alloc] init]];
        [[self task] setStandardOutput:[self pipe]];

        NSFileHandle *fileHandle = [[self pipe] fileHandleForReading];

        NSNotificationCenter *notifCenter = [NSNotificationCenter defaultCenter];
        [notifCenter removeObserver:self];
        [notifCenter addObserver:self
                        selector:@selector(dataReady:)
                            name:NSFileHandleReadCompletionNotification
                          object:fileHandle];
        [notifCenter addObserver:self
                        selector:@selector(taskTerminated:)
                            name:NSTaskDidTerminateNotification
                          object:[self task]];

        [[self task] launch];
        [[self outputView] setString:@""];

        [fileHandle readInBackgroundAndNotify];
    }
}

- (void)appendData:(NSData *)data {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSTextStorage *textStorage = [[self outputView] textStorage];
    [textStorage replaceCharactersInRange:NSMakeRange([textStorage length], 0) withString:str];
}

- (void)dataReady:(NSNotification *)notif {
    NSData *data = [[notif userInfo] valueForKey:NSFileHandleNotificationDataItem];
    NSLog(@"dataReady: %ld bytes", [data length]);

    if ([data length]) {
        [self appendData:data];
    }

    // If the task is running, start reading again
    if ([self task]) {
        [[[self pipe] fileHandleForReading] readInBackgroundAndNotify];
    }
}

- (void)taskTerminated:(NSNotification *)notif {
    NSLog(@"taskTerminated:");
    [self setTask:nil];
    [[self startButton] setState:0];
}

@end
