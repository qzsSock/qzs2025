//
//  UIImage+Extension.h
//  MimiLife_User
//
//  Created by HeLiulin on 15/12/17.
//  Copyright © 2015年 zzz003. All rights reserved.
//

//这三个属性 主要是让水印文字和水印文字之间间隔的效果，以及水印的文字的倾斜角度 ，不设置默认为平行角度
#define HORIZONTAL_SPACEING 60//水平间距
#define VERTICAL_SPACEING 100//竖直间距
#define CG_TRANSFORM_ROTATING (-M_PI_2 / 3)//旋转角度(正旋45度 || 反旋45度)


#import <UIKit/UIKit.h>



@interface UIImage (Extension)
/**
 *  根据给定颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  按原比例压缩图片
 *
 *  @param defineWidth 横向分辨率
 *
 *  @return 处理后的图片
 */
- (UIImage*)imageCompressForWidth:(CGFloat)defineWidth;
/**
 *  修正图片旋转方向
 *
 *  @return 处理后的图片
 */
- (UIImage *)fixOrientation;
/**
 *  从SDK资源包中取图片
 *
 *  @param imageName 图片名称
 *
 *  @return UIImage对象
 */
+ (UIImage *) bundleImageName:(NSString*)imageName;

+(UIImage*)view:(UIImageView *)view WaterImageWithImage:(UIImage *)image text:(NSString *)text;

@end
