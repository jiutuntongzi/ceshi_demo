//
//  CustomPaopaoView.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//


#import "CustomPaopaoView.h"
#define kPortraitMargin     5
#define kPortraitWidth      50
#define kPortraitHeight     50
#define kTitleWidth         120
#define kTitleHeight        20
#define kArrorHeight 0

@interface CustomPaopaoView ()

@property (nonatomic, strong) UIImageView *portraitView;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation CustomPaopaoView

#pragma mark - draw rect

- (void)drawRect:(CGRect)rect
{
[self drawInContext:UIGraphicsGetCurrentContext()];

self.layer.shadowColor = [[UIColor clearColor] CGColor];
self.layer.shadowOpacity = 1.0;
self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
}

- (void)drawInContext:(CGContextRef)context
{
CGContextSetLineWidth(context, 2.0);
CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.3 green:0.5 blue:1 alpha:0.8].CGColor);

    [self getDrawPath:context];
    CGContextFillPath(context);
}
- (void)getDrawPath:(CGContextRef)context
{
    CGRect rrect = self.bounds;
    CGFloat radius = rrect.size.width/2;
    CGFloat minx = CGRectGetMinX(rrect),
    midx = CGRectGetMidX(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect)-kArrorHeight;

    CGContextMoveToPoint(context, midx+kArrorHeight, maxy);
    CGContextAddLineToPoint(context,midx, maxy+kArrorHeight);
    CGContextAddLineToPoint(context,midx-kArrorHeight, maxy);

    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextClosePath(context);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    // 添加图片，即商户图
//    self.portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(kPortraitMargin, kPortraitMargin, kPortraitWidth, kPortraitHeight)];
//
//    self.portraitView.backgroundColor = [UIColor blackColor];
//    [self addSubview:self.portraitView];

    // 添加标题，即商户名
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    self.titleLabel.center = CGPointMake(70./2, kPortraitMargin * 5);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = self.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];

    // 添加副标题，即商户地址
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 60, 30)];
    self.subtitleLabel.center = CGPointMake(70./2, CGRectGetMaxY(self.titleLabel.frame)+ 5);
    self.subtitleLabel.font = [UIFont systemFontOfSize:12];
    self.subtitleLabel.textColor = [UIColor whiteColor];
    self.subtitleLabel.text = self.subtitle;
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.subtitleLabel];
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)setSubtitle:(NSString *)subtitle
{
    self.subtitleLabel.text = subtitle;
}

- (void)setImage:(UIImage *)image
{
    self.portraitView.image = image;
}

@end
