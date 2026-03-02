//
//  UIViewController+qzs.m
//  Procuratorate
//
//  Created by 邱子硕 on 2020/6/25.
//  Copyright © 2020 zjjcy. All rights reserved.
//

#import "UIViewController+qzs.h"
#import <objc/runtime.h>
#import "UIKit/UIKit.h"

@implementation UIViewController (qzs)


+(void)load {
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(ac_viewDidAppear));
}
 
//设置导航栏返回按钮文字
- (void)ac_viewDidAppear{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"      "
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:nil];
   
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:ImageWithName(@"back") style:@"   " target:self action:nil];
    
    
    
   
    [self ac_viewDidAppear];
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
     
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
     
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

//pop 到新建群界面
- (BOOL)popViewControllerWithClassString:(NSString *)ClassString{
    
    if (self.navigationController) {
        Class class = NSClassFromString(ClassString);
        UIViewController *viewController;
        for (UIViewController *vc in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:class]) {
                viewController = vc;
                break;
            }
        }
        if (viewController) {
            [self.navigationController popToViewController:viewController animated:YES];
            return YES;
        }else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}

- (UIModalPresentationStyle)modalPresentationStyle{
    return UIModalPresentationFullScreen;
}

-(void)windowFilter
{
    //获取RGBA颜色数值
    CGFloat r,g,b,a;
    [[UIColor lightGrayColor] getRed:&r green:&g blue:&b alpha:&a];
    //创建滤镜
    id cls = NSClassFromString(@"CAFilter");
    id filter = [cls filterWithName:@"colorMonochrome"];
    //设置滤镜参数
    [filter setValue:@[@(r),@(g),@(b),@(a)] forKey:@"inputColor"];
    [filter setValue:@(0) forKey:@"inputBias"];
    [filter setValue:@(1) forKey:@"inputAmount"];
    //设置给window

   
    KAppDelegate.window.layer.filters = [NSArray arrayWithObject:filter];

}

-(void)hideWindowFilter
{
    KAppDelegate.window.layer.filters = nil;
   

}


@end
