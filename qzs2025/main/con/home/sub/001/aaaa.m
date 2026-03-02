//
//  aaaa.m
//  qzs2025
//
//  Created by qiuzishuo on 2026/3/2.
//

#import "aaaa.h"
#import "aaacell.h"
NS_ASSUME_NONNULL_BEGIN
@interface aaaa  () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView*table;
@end
@implementation aaaa
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaHeight, kScreenW, kScreenH-kNaHeight) style:UITableViewStyleGrouped];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[aaacell class] forCellReuseIdentifier:@"aaacell"];
//    [self.view addSubview:self.table];
    
    NSLog(@"001");
    
    NSLog(@"20260303");

}

@end

NS_ASSUME_NONNULL_END
