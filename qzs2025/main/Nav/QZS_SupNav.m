//
//  QZS_SupNav.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/27.
//

#import "QZS_SupNav.h"

NS_ASSUME_NONNULL_BEGIN

@implementation QZS_SupNav
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    

    
    
}

- (void) viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
     if (self.childViewControllers.count==1) {
         viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
     }
     [super pushViewController:viewController animated:animated];
}
@end

NS_ASSUME_NONNULL_END
