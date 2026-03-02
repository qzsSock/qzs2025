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
    
    cell.top2.text = [NSString stringWithFormat:@"%zd",(indexPath.row+1)];

    return  cell;
}
@end

NS_ASSUME_NONNULL_END
