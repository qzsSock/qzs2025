//
//  HomeController.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/27.
//


//#import "MyController.h"

#import "HomeController.h"
#import "testVC.h"
#import "aaaa.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HomeController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITabBarItem*work= self.tabBarController.tabBar.items[2];
    //    work.badgeColor = [UIColor yellowColor];
    work.badgeValue = @"26";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


        UITabBarItem*work= self.tabBarController.tabBar.items[2];
        
        work.image = [[UIImage imageNamed:@"tab_my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        work.selectedImage = [[UIImage imageNamed:@"tab_select_my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    });
    
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 80, 30);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitle:@"push11" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pushVc:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton*btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 400, 80, 30);
    btn2.tag = 100;
    [btn2 setTitle:@"push" forState:UIControlStateNormal];
    [btn2 setTitle:@"push22" forState:UIControlStateSelected];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(pushVc:) forControlEvents:UIControlEventTouchUpInside];
    
    //    self.view.backgroundColor = [UIColor grayColor];
    
    //    MyController*vc = [[MyController alloc] init];
    
    
}

-(void)pushVc:(UIButton*)btn
{
    if (btn.tag == 100) {
        aaaa*vc = [[aaaa alloc] init];
        vc.title = @"aaaa";
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        testVC*vc = [[testVC alloc] init];
        vc.title = @"ceshi";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}



@end

NS_ASSUME_NONNULL_END
