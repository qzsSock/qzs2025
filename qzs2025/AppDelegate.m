//
//  AppDelegate.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/7/25.
//

#import "AppDelegate.h"
#import "QZS_SpuTab.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [self setUpNav];
    // 创建窗口并绑定到当前场景
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 设置根视图控制器
    self.window.rootViewController = [[QZS_SpuTab alloc] init];
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)setUpNav
{
    //导航栏控件颜色
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:@"#151E26"]];

    // 导航栏背景颜色
    UIColor *navBarBgColor = [UIColor colorWithHexString:@"#F6F8FA"];
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *apperance = [[UINavigationBarAppearance alloc] init];
        apperance.backgroundColor = navBarBgColor;
        [UINavigationBar appearance].standardAppearance = apperance;
        [UINavigationBar appearance].scrollEdgeAppearance = apperance;
    } else {
        [UINavigationBar appearance].barTintColor = navBarBgColor;
    }

  
    // 导航栏标题文本样式
    NSDictionary *titleStyle = @{
        NSForegroundColorAttributeName: [UIColor redColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:17]
    };
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *apperance = [[UINavigationBarAppearance alloc]init];
        [apperance setTitleTextAttributes: titleStyle];
        [UINavigationBar appearance].standardAppearance = apperance;
        [UINavigationBar appearance].scrollEdgeAppearance = apperance;
    } else {
        [UINavigationBar appearance].titleTextAttributes = titleStyle;
    }

 
}

-(void)setUpNav22
{
    //自定义返回按钮  (全局设置)控件颜色  按钮颜色

    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:@"#151E26"]];
    
    
    
 
    //    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    
    
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#EEEEEE"]]];
    
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"back"];
    
    if (@available(iOS 15.0, *)) {
        [UITableView appearance].sectionHeaderTopPadding = 0;
        UINavigationBar *navBar = [UINavigationBar appearance];
        NSDictionary *dic =[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize: 17],NSFontAttributeName, [UIColor colorWithHexString:@"#151E26"],NSForegroundColorAttributeName, nil];
        UINavigationBarAppearance *appearance  = [UINavigationBarAppearance new];
        appearance.backgroundColor = [UIColor whiteColor];
        appearance.shadowColor = [UIColor colorWithHexString:@"#EEEEEE"];
        //导航栏文字颜色
        appearance.titleTextAttributes = dic;
        
        [appearance setBackIndicatorImage:[UIImage imageNamed:@"back"] transitionMaskImage:[UIImage imageNamed:@"back"] ];
        
        //        appearance.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
        //        appearance.backIndicatorImage = [UIImage imageNamed:@"back"];
        navBar.scrollEdgeAppearance = appearance;
        navBar.standardAppearance = appearance;
    }
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//   
//    
//    
//    
//    
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
