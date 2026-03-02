//
//  testVC.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/28.
//

#import "testVC.h"
#import "homeCell.h"


NS_ASSUME_NONNULL_BEGIN
@interface testVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView*table;

@property (nonatomic,strong) homeCell*tranCell;
@property (nonatomic,assign) CGFloat tableH;

@property (nonatomic,assign) CGFloat totalH;
@property (nonatomic,assign) NSInteger ShowCellindex;

@property (nonatomic,strong) NSArray*CellHAry;
@end

@implementation testVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //    NSLog(@"%f",kNaHeight);
    //    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    //    NSLog(@"%f",kBottomHeight);
    
    NSLog(@"%f",kScreenH-kNaHeight);
    self.tableH = kScreenH-kNaHeight;
    
    
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaHeight,kScreenW, kScreenH-kNaHeight)];
    self.table.dataSource = self;
    self.table.delegate = self;
    [self.table registerClass:[homeCell class] forCellReuseIdentifier:@"homeCell"];
    [self.view addSubview:self.table];
    
    NSArray *ary = @[@"200",@"220",@"210",@"180",@"190",@"230",@"170",@"206",@"160",@"177",@"188",@"199",@"211",@"241",@"209",@"168",@"173",@"175",@"185",@"189",@"222"];
    self.CellHAry = ary;
    
    [self cheackShoWCell];
    
    [self.table reloadData];
    
    
    
    
}

-(void)cheackShoWCell
{
    
    NSInteger index = [self.CellHAry indexOfObject:@"230"];
    self.ShowCellindex = index;
    
    NSArray * newAry = [self.CellHAry objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, index+1)]];
    
    NSLog(@"%@",newAry);
    
    
    
    CGFloat H = 0;
    for (int i = 0; i<newAry.count; i++) {
        H+=[newAry[i] floatValue];
    }
    
    self.totalH = H;
    
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.CellHAry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.CellHAry[indexPath.row] floatValue];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    homeCell*cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath ];
    
    cell.requiredLabel.text = [NSString stringWithFormat:@"%@",self.CellHAry[indexPath.row]];
    
    if(indexPath.row == self.ShowCellindex)
    {
        
        self.tranCell = cell;
        //        cell.arrow.layer.transform =  CATransform3DMakeRotation(M_PI/4, 0, 1, 0);
        
        //        /* 旋转 */
        //
        //        // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
        //        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        //
        //        // 设定动画选项
        //        animation.duration = 2.5; // 持续时间
        ////        animation.repeatCount = 1; // 重复次数
        //
        //        // 设定旋转角度
        //        animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
        //        animation.toValue = [NSNumber numberWithFloat:2 * M_PI]; // 终止角度
        //
        //        // 添加动画
        //        [cell.arrow.layer addAnimation:animation forKey:@"rotate-layer"];
        //
        
        
        
        
        //        cell.arrow.transform =CGAffineTransformRotate(cell.arrow.transform, M_PI_4);
        
        
        
        
        
        
    }
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    CGFloat sectionHeaderHeight = 10.0;
    //    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
    //        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    //    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
    //        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    //    }
    
    
    
    NSLog(@"%f",scrollView.contentOffset.y);
    
    //    NSLog(@"%f",self.table.contentSize.height);
    
    CGFloat h = scrollView.contentOffset.y-self.totalH+self.tableH;
    if (h > 0) {
        
        
        if(h > 90)
        {
            
            
            if( h > 180)
            {
                NSLog(@"00000 %f",h);
                self.tranCell.layer.transform =  CATransform3DMakeRotation(0, 0, 1, 0);
            }else
            {
                self.tranCell.layer.transform =  CATransform3DMakeRotation( radians(h+180), 0, 1, 0);
                
            }
            
            
        }
        else
        {
            NSLog(@"1111 %f",h);
            //            radians(45.0);
            self.tranCell.layer.transform =  CATransform3DMakeRotation( radians(h), 0, 1, 0);
        }
        
        
        
        
    }else
    {
        NSLog(@"22222 %f",h);
        self.tranCell.layer.transform =  CATransform3DMakeRotation(0, 0, 1, 0);
    }
    
    
    
    
    
    
    
}



double radians(double degrees) {
    return degrees * M_PI / 180.0;
}


@end

NS_ASSUME_NONNULL_END
