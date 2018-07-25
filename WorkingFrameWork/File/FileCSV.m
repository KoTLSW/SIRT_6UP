//
//  FileCSV.m
//  HowToWorks
//
//  Created by h on 17/3/16.
//  Copyright © 2017年 bill. All rights reserved.
//

#import "FileCSV.h"
#import "AppDelegate.h"
#import "Common.h"
#import "Lock.h"
//=======================================
@interface FileCSV (){
    NSString               *  csvpath;
    Lock                   *  _lock;
    
    AppDelegate   * app;
}
@end
//=======================================
@implementation FileCSV
//=======================================


static FileCSV * _csvFile = nil;

+(instancetype) shareInstance
{
    
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _csvFile = [[self alloc] init] ;
    }) ;
    
    return _csvFile;
}


- (id)init
{
    
    self = [super init];
    
    if (self)
    {
         csvpath = nil;
         app = [NSApplication sharedApplication].delegate;
    }
    
    return self;
}

- (void)addGlobalLock
{
    _lock = [Lock shareInstance];
    
}


//=======================================
- (BOOL)CSV_Open:(NSString*)path
{
    @synchronized (self) {
        
        
        NSFileManager *fm=[NSFileManager defaultManager];
        csvpath = path;
        
        if(![fm fileExistsAtPath:path])
        {
            [fm createFileAtPath:path contents:nil attributes:nil];
            
            return NO;
        }
        return YES;
        

    }
    
}
//=======================================
- (void)CSV_Write:(NSString*)line
{
//    @synchronized (numstring) {
    
         [_lock lock];
        if( csvpath != nil )
        {
            //创建写文件句柄
            NSFileHandle *file = [NSFileHandle fileHandleForWritingAtPath:csvpath];
            
            //找到并定位到outFile的末尾位置(在此后追加文件)
            [file seekToEndOfFile];
            
            //写入字符串
            [file writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
            
            //[NSThread sleepForTimeInterval:2];
            //关闭文件
            [file closeFile];
            
            NSLog(@"线程%@====文件操作完毕",[NSThread currentThread]);
        }
    
         [_lock unlock];
//    }
    
    
}
//=======================================
@end
//=======================================
