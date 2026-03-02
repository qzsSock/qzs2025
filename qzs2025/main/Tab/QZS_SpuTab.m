//
//  QZS_SpuTab.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/27.
//

#import "QZS_SpuTab.h"
#import "QZS_SupNav.h"

NS_ASSUME_NONNULL_BEGIN

static NSString const *normorCol = @"#333333";
static NSString const *selectCol = @"#4A77F2";

//static NSString const *normorCol = @"#987777";
//static NSString const *selectCol = @"#089899";


@interface QZS_SpuTab ()

@property (nonatomic,strong) NSArray*dataArray;

@end
@implementation QZS_SpuTab

-(void)viewDidLoad
{
    [super viewDidLoad];
//    [self setUpInfo];
    
//    UITabBarItem *appearance = [UITabBarItem appearance];
//        [appearance setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:normorCol],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//
//        [appearance setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:selectCol],NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
    [self addWithProcurator];
   
}

-(void)setUpInfo
{
    if (@available(iOS 13.0, *)) {
      
//        UITabBarItem *item = [UITabBarItem appearance];
//        // 设置未被选中的颜色
////            appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]};
//        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor colorWithHexString:normorCol]];
//        
//        [item setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:normorCol],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//      
//        [item setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:selectCol],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        
        
//        self.tabBar.tintColor = [UIColor colorWithHexString:selectCol];
//        self.tabBar.unselectedItemTintColor = [UIColor colorWithHexString:normorCol];
//           UITabBarItem *item = [UITabBarItem appearance];
////           item.titlePositionAdjustment = UIOffsetMake(0, -2);
//           [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//           [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
//      
            
        if (@available(iOS 15.0, *)) {
           
//            UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
//            //tabBaritem title选中状态颜色
//            appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{
//                NSForegroundColorAttributeName:[UIColor colorWithHexString:selectCol],
//            };
//            //tabBaritem title未选中状态颜色
//            appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{
//                NSForegroundColorAttributeName:[UIColor colorWithHexString:normorCol],
//            };
//            //tabBar背景颜色
//            appearance.backgroundColor = [UIColor yellowColor];
//            self.tabBarItem.scrollEdgeAppearance = appearance;
//            self.tabBarItem.standardAppearance = appearance;

        }

       
    } else {
        UITabBarItem *appearance = [UITabBarItem appearance];
            [appearance setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:normorCol],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];

            [appearance setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:selectCol],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];

    }

}

- (void)addWithProcurator
{
   
        
        
        self.dataArray = @[
            @{
//
              @"controller":@"HomeController",
                @"title":@"首页",
                @"tab_icon":@"tab_home",
                @"tab_select_icon":@"tab_select_home",
            },
            @{
                @"controller":@"SpecialXFmenuController",
                @"title":@"信访",
                @"tab_icon":@"tab_xinfang",
                @"tab_select_icon":@"tab_select_xinfang",
            },
           
            @{
                @"controller":@"workBench",
                @"title":@"工作台",
                @"tab_icon":@"work_normal",
                @"tab_select_icon":@"work_select",
            },
            @{
                @"controller":@"ViewController",
                @"title":@"检务公开",
                @"tab_icon":@"tab_jianwugongkai",
                @"tab_select_icon":@"tab_select_jianwugongkai",
            },
           
            @{
                @"controller":@"MyController", //MyController
                @"title":@"我的",
                @"tab_icon":@"tab_my",
                @"tab_select_icon":@"tab_select_my",
            },
        ];
        
        NSMutableArray *vcArray = [NSMutableArray array];
        for (NSDictionary *dict in self.dataArray) {

          
                UIViewController *vc = [[NSClassFromString(dict[@"controller"]) alloc] init];
                QZS_SupNav *lh_nav2 = [[QZS_SupNav alloc] initWithRootViewController:vc];
                vc.title = dict[@"title"]?dict[@"title"]:@"";
                if (dict[@"tab_icon"]) {
                    lh_nav2.tabBarItem.image = [[UIImage imageNamed:dict[@"tab_icon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    lh_nav2.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"tab_select_icon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
                [vcArray addObject:lh_nav2];
            
        }
        self.viewControllers = [NSArray arrayWithArray:vcArray];
        
        
   
    
    
}

@end

NS_ASSUME_NONNULL_END
