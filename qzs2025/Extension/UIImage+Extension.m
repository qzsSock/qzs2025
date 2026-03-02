//
//  UIImage+Extension.m
//  MimiLife_User
//
//  Created by HeLiulin on 15/12/17.
//  Copyright © 2015年 zzz003. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/**
 *  图片压缩
 *
 *  @param sourceImage 原图片
 *  @param defineWidth 宽度
 *
 *  @return 处理后的图片
 */
-(UIImage *) imageCompressForWidth:(CGFloat)defineWidth
{
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [self drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *) bundleImageName:(NSString*)imageName
{
    NSString *imgPath=[NSString stringWithFormat:@"WebXHBundle.bundle/Contents/Resources/%@",imageName];
    return [UIImage imageNamed:imgPath];
}



+(UIImage*)view:(UIImageView *)view WaterImageWithImage:(UIImage *)image text:(NSString *)text{

//设置水印大小，可以根据图片大小或者view大小
CGFloat  img_w = view.bounds.size.width;
CGFloat  img_h = view.bounds.size.height;

 //1.开启上下文
//    UIGraphicsBeginImageContext(CGSizeMake(img_w, img_h));
UIGraphicsBeginImageContextWithOptions(CGSizeMake(img_w, img_h), NO, 0.0);
//2.绘制图片 水印图片
[image drawInRect:CGRectMake(0, 0, img_w, img_h)];

 /* --添加水印文字样式--*/
UIFont * font = [UIFont systemFontOfSize:16.0]; //水印文字大小
NSDictionary * attr = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#151E26" alpha:0.2]};
NSMutableAttributedString * attr_str =[[NSMutableAttributedString alloc]initWithString:text attributes:attr];

//文字：字符串的宽、高
CGFloat str_w = attr_str.size.width;
CGFloat str_h = attr_str.size.height;

//根据中心开启旋转上下文矩阵，绘制水印文字
CGContextRef context = UIGraphicsGetCurrentContext();

//将绘制原点（0，0）调整到源image的中心
CGContextConcatCTM(context, CGAffineTransformMakeTranslation(img_w/2, img_h/2));
//以绘制原点为中心旋转
CGContextConcatCTM(context, CGAffineTransformMakeRotation(CG_TRANSFORM_ROTATING));

//将绘制原点恢复初始值，保证context中心点和image中心点处在一个点(当前context已经发生旋转，绘制出的任何layer都是倾斜的)
CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-img_w/2, -img_h/2));

//sqrtLength：原始image对角线length。在水印旋转矩阵中只要矩阵的宽高是原始image的对角线长度，无论旋转多少度都不会有空白。
CGFloat sqrtLength = sqrt(img_w*img_w + img_h*img_h);
    
    


//计算需要绘制的列数和行数
int count_Hor = sqrtLength / (str_w + 40) + 1;
int count_Ver = sqrtLength / (str_h + 60) + 1;
    

//此处计算出需要绘制水印文字的起始点，由于水印区域要大于图片区域所以起点在原有基础上移
CGFloat orignX = -(sqrtLength-img_w)/2;
CGFloat orignY = -(sqrtLength-img_h)/2;
//    orignX = 0;
//    orignY = 0;

//在每列绘制时X坐标叠加
CGFloat overlayOrignX = orignX;
//在每行绘制时Y坐标叠加
CGFloat overlayOrignY = orignY;
for (int i = 0; i < count_Hor * count_Ver; i++) {
    //绘制图片
    [text drawInRect:CGRectMake(overlayOrignX, overlayOrignY, str_w, str_h) withAttributes:attr];
    if (i % count_Hor == 0 && i != 0) {
        overlayOrignX = orignX;
        overlayOrignY += (str_h + 40);
    }else{
        overlayOrignX += (str_w + 60);
    }
}

 //3.从上下文中获取新图片
 UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();

  [view.layer renderInContext:UIGraphicsGetCurrentContext()];

  //4.关闭图形上下文
  UIGraphicsEndImageContext();
  CGContextRestoreGState(context);


  return newImage;
}
@end
