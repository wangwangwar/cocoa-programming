//
//  Document.m
//  ZIPspector
//
//  Created by wangwangwar on 15/7/21.
//
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the
    // document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple
    // NSWindowControllers, you should remove this method and override -makeWindowControllers
    // instead.
    return @"Document";
}

- (BOOL)readFromURL:(NSURL *)url
             ofType:(NSString *)typeName
              error:(NSError *__autoreleasing *)outError {
    NSString *filename = [url path];

    // Prepare a task object
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/zipinfo"];
    NSArray *args = [NSArray arrayWithObjects:@"-1", filename, nil];
    [task setArguments:args];

    // Create the pipe to read from
    NSPipe *outPipe = [[NSPipe alloc] init];
    [task setStandardOutput:outPipe];

    // Start the process
    [task launch];

    // Read the output
    NSData *data = [[outPipe fileHandleForReading] readDataToEndOfFile];

    // Make sure the task terminates normally
    [task waitUntilExit];
    int status = [task terminationStatus];

    // Check status
    if (status != 0) {
        if (outError) {
            NSDictionary *errorDict = @{ NSLocalizedFailureReasonErrorKey : @"zipinfo failed" };
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:errorDict];
        }
        return NO;
    }

    // Convert to a string
    NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    // Break the string into lines
    [self setFilenames:[aString componentsSeparatedByString:@"\n"]];
    NSLog(@"filenames = %@", [self filenames]);

    // In case of revert
    [[self tableView] reloadData];

    return YES;
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [[self filenames] count];
}

- (id)tableView:(NSTableView *)tableView
    objectValueForTableColumn:(NSTableColumn *)tableColumn
                          row:(NSInteger)row {
    return [[self filenames] objectAtIndex:row];
}

@end
