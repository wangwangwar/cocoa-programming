//
//  Document.m
//  RaiseMan
//
//  Created by wangwangwar on 15/7/19.
//  Copyright (c) 2015年 Sunbird. All rights reserved.
//

#import "Document.h"
#import "Person.h"

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

- (void)setEmployees:(NSMutableArray *)a {
    if (a == _employees) {
        return;
    }

    _employees = a;
}

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index {
    NSLog(@"adding %@ to %@", p, [self employees]);
    // Add the inverse of this operation to the undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add Person"];
    }

    // Add the Persion to the array
    [[self employees] insertObject:p atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index {
    Person *p = [[self employees] objectAtIndex:index];
    NSLog(@"removing %@ from %@", p, [self employees]);
    // Add the inverse of this operation to the undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove Person"];
    }

    [[self employees] removeObjectAtIndex:index];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the
    // document's window.
    self.employees = [[NSMutableArray alloc] initWithObjects:[[Person alloc] init], nil];
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

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL,
    // ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or
    // -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod"
                format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError
    // != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or
    // -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if
    // the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod"
                format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

@end
