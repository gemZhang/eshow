//
//
//  
//
//  Created by 徐仁强 on 15/8/16.
//  Copyright (c) 2015年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyController : NSObject

#pragma mark --判断设备型号
//+(NSString *)platformString;
#pragma mark --创建Label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(int)font Text:(NSString*)text;
#pragma mark --创建View
+(UIView*)viewWithFrame:(CGRect)frame;
#pragma mark --创建imageView
+(UIImageView*)createImageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName;
#pragma mark --创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title;
#pragma mark --创建UITextField
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font;

//适配器的方法  扩展性方法
//现有方法，已经在工程里面存在，如果修改工程内所有方法，工作量巨大，就需要使用适配器的方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName;
#pragma mark 创建UIScrollView
+(UIScrollView*)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size;
#pragma mark 创建UIPageControl
+(UIPageControl*)makePageControlWithFram:(CGRect)frame;
#pragma mark 创建UISlider
+(UISlider*)makeSliderWithFrame:(CGRect)rect AndImage:(UIImage*)image;
#pragma mark 创建时间转换字符串
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date;
#pragma mark --判断导航的高度64or44
+(float)isIOS7;
#pragma mark - 通知栏高度
+(float)StatusBar;
#pragma mark 内涵图需要的方法
+ (NSString *)stringDateWithTimeInterval:(NSString *)timeInterval;
#pragma mark - 返回动态高度
+ (CGFloat)textHeightWithString:(NSString *)text width:(CGFloat)width fontSize:(NSInteger)fontSize;
#pragma mark 返回一个整数字符串加1后的新字符串
+ (NSString *)addOneByIntegerString:(NSString *)integerString;
#pragma mark 色值转换
+ (UIColor *) colorWithHexString: (NSString *)color;
#pragma mark- 获取屏幕的宽
+ (CGFloat)getScreenWidth;
#pragma mark- 获取屏幕的高
+ (CGFloat)getScreenHeight;
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
#pragma - mark 弹出一个提示框
+(void)HelpfulHints:(NSString*)text addView:(UIView*)addView;
+ (int)convertToInt:(NSString*)strtemp;
#pragma - mark 时间转字符串
+ (NSString *)stringFromDate:(NSDate *)date;
#pragma - mark 根据字符串日期，返回距离该日期时间间隔，几分钟，几小时之前
+(NSString*)formatString:(NSString*)timeString;
#pragma - mark 根据字符串和格式，返回日期
+(NSDate *)dateFromString:(NSString *)timeString formate:(NSString*)formate;
#pragma - mark 根据日期和格式，返回字符串日期
+(NSString *)stringFromDate:(NSDate *)date formate:(NSString*)formate;
#pragma mark - 判断空字符串
+ (BOOL) isBlankString:(NSString *)string;




/*文件处理*/
//文件路径是否存在
+ (BOOL)fileExists:(NSString *)fullPathName;

//根据文件路径删除文件
+ (BOOL)remove:(NSString *)fullPathName;

//创建文件
+ (void)makeDirs:(NSString *)dir;

//documentPath路径是否存在
+ (BOOL)fileExistInDocumentPath:(NSString*)fileName;

//返回完整的documentPath下文件路径
+ (NSString*)documentPath:(NSString*)fileName;

//删除documentPath路径下文件
+ (BOOL)deleteDocumentFile:(NSString*)fileName;

//cachePath路径是否存在
+ (BOOL)fileExistInCachesPath:(NSString*)fileName;

//返回完整的cachePath下文件路径
+ (NSString*)cachesFilePath:(NSString*)fileName;

//删除cachePath下文件路径
+ (BOOL)deleteCachesFile:(NSString*)fileName;

/*时间处理*/
//CST时间格式转换
+ (NSString *)convertDateFromCST:(NSString *)_date;

//转换NSDate格式为字符串"yyyy-MM-dd HH:mm:ss"
+ (NSString *)encodeTime:(NSDate *)date;

//转换字符串为"yyyy-MM-dd HH:mm:ss"格式到NSDate
+ (NSDate *)dencodeTime:(NSString *)dateString;

//转换字符串为"yyyy-MM-dd HH:mm"格式的NSDate
+ (NSString *)dencodeDateStr:(NSString *)dateStr format:(NSString *)format;

//装换NSDate格式到NString
+ (NSString *)encodeTime:(NSDate *)date format:(NSString *)format;

//转换NString到NSdate
+ (NSDate *)dencodeTime:(NSString *)dateString format:(NSString *)format;

//从现在到某天的时间
+ (NSString *)timeSinceNow:(NSDate *)date;

//把秒转化为时间字符串显示，播放器常用
+ (NSString *)changeSecondsToString:(CGFloat)durartion;

/*跳转处理*/
//跳转到电子市场页面
+ (void)goToAppStoreHomePage:(NSInteger)appid;

//跳转到电子市场评论页面
+ (void)goToAppStoreCommentPage:(NSInteger)appid;

//跳到短信页面
+ (void)goToSmsPage:(NSString*)phoneNumber;

//打开浏览器
+ (void)openBrowse:(NSString*)url;

//打开EMAIL
+ (void)openEmail:(NSString*)email;

/*其他处理*/
//返回字节大小
+ (NSString*)getSize:(NSNumber*)number;

//获取空余磁盘信息
+ (CGFloat)freeDiskSpace;

//返回随即数
+ (NSInteger)getRandomNumber:(NSInteger)min maxNumber:(NSInteger)max;

//返回UILabel高度
+ (CGFloat)returnHeightFloat:(NSString *)str frontSize:(UIFont*)front frontWidth:(CGFloat)frontwidth;

//返回mac地址
+ (NSString *)macAddress;

+ (NSString *)encode:(NSString *)s;

//图片压缩
+ (UIImage *)image:(UIImage *)image fitInsize:(CGSize)viewsize;

+ (NSString *)systemTime:(NSString *)format;//time  string>string

//增加icloud不被备份
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

//简单过渡效果
+ (CATransition *)creatAnmitionFrom:(NSInteger)direction;

+ (CATransition *)creatAnmitionHorizontalFrom:(NSInteger)direction;

+ (CATransition *)creatAnmitionDisplayScreenView:(NSInteger)direction;

+ (NSObject *)initPropertyWithClass:(NSObject *)infoObject fromDic:(NSDictionary *)jsonDic;

//去除Null
+ (NSString *)returnStr:(id)object;

//改变label颜色
+ (NSMutableAttributedString *)changeText:(NSString *)countStr content:(NSString *)content changeTextFont:(UIFont *)changeTextFont textFont:(UIFont *)textFont changeTextColor:(UIColor *)changeTextColor textColor:(UIColor *)textColor;
+(void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor;

@end
