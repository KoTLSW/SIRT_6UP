//
//  MK_FileFolder.m
//  File
//
//  Created by Michael on 16/11/3.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import "MK_FileFolder.h"

@implementation MK_FileFolder

+(MK_FileFolder *)shareInstance
{
    static MK_FileFolder *fileFolder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fileFolder = [[MK_FileFolder alloc] init];
    });
    
    return fileFolder;
}

//新建文件夹folder: 依靠传入的 subjectName 来判断文件夹是否存在,不存在则新建文件夹
-(BOOL)createOrFlowFolderWithCurrentPath:(NSString *)currentPath SubjectName:(NSString *)subjectName
{
    
    if (currentPath==nil || [currentPath isEqualToString:@""] || subjectName==nil || [subjectName isEqualToString:@""])
    {
        if (subjectName)
        {
            subjectName = subjectName;
        }
        else
        {
            subjectName = @"MK_logFile";
        }
        if (currentPath)
        {
            currentPath = currentPath;
        }
        else
        {
            currentPath = @"/Users/Desktop/";
        }
    }
    
    //=============== 总文件夹 =====================
    
    //获取本地时间日期
    NSDate *dateT = [[NSDate alloc] init];
    //    NSLog(@"%@",dateT);
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // Get Current  time
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *folderDateStr = [NSString stringWithFormat:@"%@",[formatter stringFromDate:dateT]];
    
    //创建文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    
    //============================================
    NSString *key=@"folderPathKey";
    if ([subjectName containsString:@"Station"]) {
        key=@"folderPathKeyS";
    }
    //============================================
    if (![subjectName containsString:@"Station"]) {
        //将要创建的文件夹拼接到路径中(文件夹路径事先与缓存默认的路径对比)
        if (![[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]] isEqualToString:[NSString stringWithFormat:@"%@/%@/%@",currentPath,subjectName,folderDateStr]])
        {
            
            NSLog(@"11=%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]);
            NSLog(@"12=%@",[NSString stringWithFormat:@"%@/%@/%@",currentPath,subjectName,folderDateStr]);
            self.folderPath = [currentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@/",subjectName,folderDateStr]];
            //录入缓存
            [[NSUserDefaults standardUserDefaults] setObject:self.folderPath forKey:key];
            NSLog(@"14=%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]);
            //创建文件夹目录
            BOOL isCreateFolder = [fileManager createDirectoryAtPath:self.folderPath withIntermediateDirectories:YES attributes:nil error:nil];
            
            if (isCreateFolder)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
        
        else
        {
            self.folderPath = [[NSUserDefaults standardUserDefaults] objectForKey:key];
            
            return YES;
        }
    }
    else
    {
        if (![[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:key]] isEqualToString:[NSString stringWithFormat:@"%@/%@/%@",currentPath,subjectName,[[NSUserDefaults  standardUserDefaults] objectForKey:@"theSN"]]])
        {
            
            self.folderPath = [currentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",subjectName,[[NSUserDefaults  standardUserDefaults] objectForKey:@"theSN"]]];
            //                        }
            //录入缓存
            [[NSUserDefaults standardUserDefaults] setObject:self.folderPath forKey:key];
            //创建文件夹目录
            BOOL isCreateFolder = [fileManager createDirectoryAtPath:self.folderPath withIntermediateDirectories:YES attributes:nil error:nil];
            
            if (isCreateFolder)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
        
        else
        {
            self.folderPath = [[NSUserDefaults standardUserDefaults] objectForKey:key];
            
            return YES;
        }
        
        
    }
    
}


-(BOOL)createOrFlowFolderWithCurrentPath:(NSString *)currentPath
{
    
   
    //=============== 总文件夹 =====================
    
    //获取本地时间日期
//    NSDate *dateT = [[NSDate alloc] init];
//    //    NSLog(@"%@",dateT);
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    // Get Current  time
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *folderDateStr = [NSString stringWithFormat:@"%@",[formatter stringFromDate:dateT]];
    
    //创建文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    
               //创建文件夹目录
            BOOL isCreateFolder = [fileManager createDirectoryAtPath:currentPath withIntermediateDirectories:YES attributes:nil error:nil];
            
            if (isCreateFolder)
            {
                return YES;
            }
            else
            {
                return NO;
            }
 
        
        
    
}


@end
