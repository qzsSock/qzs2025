//
//  aaacell.m
//  qzs2025
//
//  Created by qiuzishuo on 2026/3/3.
//

#import "aaacell.h"

NS_ASSUME_NONNULL_BEGIN

@implementation aaacell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.top = [[UILabel alloc] init];
        self.top.text = @"134";
        self.top.textColor = [UIColor redColor];
        self.top.font = [UIFont systemFontOfSize:14];
        self.top.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.top];
        
        
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20);
        
    }];
}

@end

NS_ASSUME_NONNULL_END
