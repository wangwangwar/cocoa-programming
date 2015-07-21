//
//  Document.h
//  ZIPspector
//
//  Created by wangwangwar on 15/7/21.
//
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument<NSTableViewDataSource>

@property(nonatomic, weak) IBOutlet NSTableView *tableView;
@property(nonatomic, strong) NSArray *filenames;

@end
