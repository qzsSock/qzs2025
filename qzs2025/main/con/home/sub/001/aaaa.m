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
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaHeight, kScreenW, kScreenH-kNaHeight) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[aaacell class] forCellReuseIdentifier:@"aaacell"];
    [self.view addSubview:self.table];
    
    NSLog(@"001");
    
    NSLog(@"20260303");

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
    aaacell*cell = [tableView dequeueReusableCellWithIdentifier:@"aaacell"];
    cell.top.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    if (indexPath.row == 0) {
        [cell.begin setTitle:@"电机我" forState:UIStatusBarStyleDefault];

    }else if(indexPath.row == 1)
    {
        [cell.begin setTitle:@"电机我东方红郡速度多了几分离开的设计规范考拉电极法立卡手打" forState:UIStatusBarStyleDefault];

    }else
    {
        [cell.begin setTitle:@"电机我东方红郡速度快" forState:UIStatusBarStyleDefault];

    }
    cell.top2.text = [NSString stringWithFormat:@"%zd",(indexPath.row+1)];

    return  cell;
}
@end

NS_ASSUME_NONNULL_END
