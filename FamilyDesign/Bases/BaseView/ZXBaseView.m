//
//  ZXBaseView.m
//  
//
//  Created by lyc on 2020/5/19.
//

#import "ZXBaseView.h"
@interface ZXBaseView()

@property (nonatomic, strong, readwrite) ZXBaseViewModel *viewModel;
@end
@implementation ZXBaseView


+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ZXBaseView *view = [super allocWithZone:zone];
    @weakify(view)
    [[view rac_signalForSelector:@selector(initWithViewModel:)]
     subscribeNext:^(id x) {
         @strongify(view)
         [view renderViews];
         [view bindViewModel];
     }];
    return view;
}

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)renderViews {
}

- (void)bindViewModel {
}

+ (instancetype)loadXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.viewEdgeInsets.left, frame.origin.y + self.viewEdgeInsets.top, frame.size.width - self.viewEdgeInsets.left - self.viewEdgeInsets.right, frame.size.height - self.viewEdgeInsets.top - self.viewEdgeInsets.bottom);
    [super setFrame:rc];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
