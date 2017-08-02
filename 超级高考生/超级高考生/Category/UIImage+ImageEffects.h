/*
     File: UIImage+ImageEffects.h
 Abstract: This is a category of UIImage that adds methods to apply blur and tint effects to an image. This is the code you’ll want to look out to find out how to use vImage to efficiently calculate a blur.
  Version: 1.0
 
*/

@import UIKit;


@interface UIImage (ImageEffects)

/**
 *  设置亮色遮罩
 */
- (UIImage *)applyLightEffect;
/**
 *  设置特亮遮罩
 */
- (UIImage *)applyExtraLightEffect;
/**
 *  设置暗色遮罩
 */
- (UIImage *)applyDarkEffect;
/**
 *  设置颜色遮罩
 *
 *  @param tintColor 遮罩颜色
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
/**
 *  设置自定义遮罩
 *
 *  @param blurRadius            高斯模糊数值
 *  @param tintColor             遮罩颜色
 *  @param saturationDeltaFactor 色相饱和度
 *  @param maskImage             遮罩照片
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
