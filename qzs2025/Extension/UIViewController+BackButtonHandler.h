//
//  UIViewController+BackButtonHandler.h
//  Procuratorate
//
//  Created by 邱子硕 on 2021/3/15.
//  Copyright © 2021 zjjcy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
- (BOOL)navigationShouldPopOnBackButton;
@end

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackButtonHandler)<BackButtonHandlerProtocol>


@end

NS_ASSUME_NONNULL_END
