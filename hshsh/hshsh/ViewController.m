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
        
        return;
    }
    
    //创建表
    
    
}



@end
