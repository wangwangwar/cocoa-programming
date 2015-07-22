//
//  DragDropView.m
//  DragDropView
//
//  Created by wangwangwar on 15/7/22.
//
//

#import "DragDropView.h"

@implementation DragDropView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
}

- (void)dealloc {
    [self setDelegate:nil];
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    NSPasteboard *pasteBoard = [sender draggingPasteboard];

    if ([[pasteBoard types] containsObject:NSFilenamesPboardType]) {
        return NSDragOperationCopy;
    }

    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    NSPasteboard *pasteBoard = [sender draggingPasteboard];
    NSArray *list = [pasteBoard propertyListForType:NSFilenamesPboardType];
    if ([self delegate] && [[self delegate] respondsToSelector:@selector(dragDropViewFileList:)]) {
        [[self delegate] dragDropViewFileList:list];
    }
    return YES;
}

@end
