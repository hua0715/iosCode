//
//  ViewController.m
//  hshsh
//
//  Created by 赵华 on 16/8/12.
//  Copyright © 2016年 heima. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
@interface ViewController ()
@property (nonatomic, strong) FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取沙盒Document路径
    NSString *pathStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *path = [pathStr stringByAppendingPathComponent:@"hahah.db"];
    
    //创建数据库
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        
        NSLog(@"数据库打开失败");
        return;
    }
    
  BOOL sucess = [db executeUpdate:@"CREATE TABLE PersonList (Name text, Age integer, Sex integer, Phone text, Address text, Photo blob)"];
    
    //创建表
    if (!sucess) {
        
        NSLog(@"创表失败");
        
        return;
    }
    
   BOOL sucess1 = [db executeUpdate:@"INSERT INTO PersonList (Name, Age, Sex, Phone, Address, Photo) VALUES (?,?,?,?,?,?)",@"Jone", [NSNumber numberWithInt:20], [NSNumber numberWithInt:0], @"091234567", @"Taiwan, ROC",@"", [NSData dataWithContentsOfFile:path]];
    
    if (!sucess) {
        
        NSLog(@"%@",db.lastErrorMessage);
    }
    
    
}





@end
