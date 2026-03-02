//
//  bbbb.m
//  qzs2025
//
//  Created by qiuzishuo on 2026/3/2.
//

#import "bbbb.h"
#import "bbbcell.h"
NS_ASSUME_NONNULL_BEGIN
@interface bbbb  () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView*table;
@end

@implementation bbbb

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"002");
    
    NSLog(@"20260303");
    
    [super viewDidLoad];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaHeight, kScreenW, kScreenH-kNaHeight) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[bbbcell class] forCellReuseIdentifier:@"bbbcell"];
    [self.view addSubview:self.table];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    bbbcell*cell = [tableView dequeueReusableCellWithIdentifier:@"bbbcell"];
//    cell.top.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return  cell;
}

@end

NS_ASSUME_NONNULL_END
