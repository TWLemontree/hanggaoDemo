//
//  ViewController.m
//  hanggaoDemo
//
//  Created by 抬头看见柠檬树 on 2017/3/31.
//  Copyright © 2017年 hn3l. All rights reserved.
//

#import "ViewController.h"

#define UILABEL_LINE_SPACE 14.0f
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *str = @"打我啊打我啊打我啊打我啊\n打我啊打我啊打我啊打我啊\n打我啊打我啊打我啊打我啊\n打我啊打我啊打我啊打我啊\n打我啊打我啊打我啊打我啊\n";
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 200, 400)];
    CGFloat lblH = [self getSpaceLabelHeight:str withFont:[UIFont systemFontOfSize:14.0f] withWidth:200];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 200, lblH)];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    label.numberOfLines = 0;
    [label setBackgroundColor:[UIColor grayColor]];
    label.text = str;
    [self.view addSubview:label];
    [self setLabelSpace:label withValue:str withFont:[UIFont systemFontOfSize:14.0f]];
    
}

#pragma mark 两个方法，设置Label的行间距，并计算带有行间距的情况下，Label的高度
- (void)setLabelSpace:(UILabel *)label withValue:(NSString *)str withFont:(UIFont *)font
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    // 在单元格中绘制文本时使用的换行符模式。
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
//    paraStyle.lineSpacing = UILABEL_LINE_SPACE;//设置行间距
    paraStyle.lineSpacing = 14.0f;
    // 尝试连字符时的阈值控制
    paraStyle.hyphenationFactor = 1.0;
    // 接收器第一行的缩进。
    paraStyle.firstLineHeadIndent = 0.0;
    // 段落顶部和文本内容开头之间的距离。
    paraStyle.paragraphSpacingBefore = 0.0;
    // 该属性包含从文本容器的前边缘到除第一个之外的行的开头的距离（以点为单位）。 此值始终为非负数。
    paraStyle.headIndent = 0;
    // 如果为正数，设置的是左边距（相当于headIndent）；如果为零或负数，设置的是右边距
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{
                          NSFontAttributeName:font,NSParagraphStyleAttributeName:paraStyle
                          , NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attrStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    // 在单元格中绘制文本时使用的换行符模式。
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    // 尝试连字符时的阈值控制
    paraStyle.hyphenationFactor = 1.0;
    // 接收器第一行的缩进。
    paraStyle.firstLineHeadIndent = 0.0;
    // 段落顶部和文本内容开头之间的距离。
    paraStyle.paragraphSpacingBefore = 0.0;
    // 该属性包含从文本容器的前边缘到除第一个之外的行的开头的距离（以点为单位）。 此值始终为非负数。
    paraStyle.headIndent = 0;
    // 如果为正数，设置的是左边距（相当于headIndent）；如果为零或负数，设置的是右边距
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, screen_height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
