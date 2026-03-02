//
//  UIViewController+qzs.h
//  Procuratorate
//
//  Created by 邱子硕 on 2020/6/25.
//  Copyright © 2020 zjjcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (qzs)
- (BOOL)popViewControllerWithClassString:(NSString *)ClassString;
-(void)windowFilter;
-(void)hideWindowFilter;

@end

NS_ASSUME_NONNULL_END
