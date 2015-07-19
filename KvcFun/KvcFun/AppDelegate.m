//
//  AppDelegate.m
//  KvcFun
//
//  Created by wangwangwar on 15/7/19.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido = %@", n);
    }
    return self;
}

- (NSInteger)fido {
    NSLog(@"-fido is returning %ld", fido);
    return fido;
}

- (void)setFido:(NSInteger)x {
    NSLog(@"-setFido: is called with %ld", x);
    fido = x;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
