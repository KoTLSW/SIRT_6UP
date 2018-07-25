//
//  Table1.h
//  B312_BT_MIC_SPK
//
//  Created by EW on 16/5/12.
//  Copyright © 2016年 h. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Item.h"
//#import "Common.h"

@interface Table : NSViewController

//=============================================
@property(readwrite,copy)NSMutableArray* arrayDataSource;

@property (strong) IBOutlet NSView *custom;

@property (weak) IBOutlet NSScrollView *scrollview;
@property (weak) IBOutlet NSTableView *table;
@property(nonatomic,strong)NSArray  * testArray;
//=============================================
- (id)init:(NSView*)parent DisplayData:(NSArray*)arrayData;

-(void)SelectRow:(int)rowindex;

-(void)flushTableRow:(Item*)item RowIndex:(NSInteger)rowIndex with:(int)fixtype;

-(void)ClearTable;

-(void)flushTableDic:(NSDictionary*)dic RowIndex:(NSInteger)rowIndex;
//=============================================
@end
