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
        
        
        self.top2 = [[UILabel alloc] init];
        self.top2.text = @"134";
        self.top2.textColor = [UIColor blueColor];
        self.top2.font = [UIFont systemFontOfSize:14];
        self.top2.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.top];
        
        self.begin  = [UIButton buttonWithType:UIButtonTypeSystem];
        //        begin.frame = CGRectMake(100, 100, 200, 50);
        [self.begin setTitle:@"点击我" forState:UIControlStateNormal];
        [self.begin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.begin.backgroundColor = [UIColor blueColor];
        self.begin.layer.cornerRadius = 10;

        // 添加点击事件
    //    [self.self addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];

        // 添加到视图
        [self.contentView addSubview:self.begin];
        
        
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
    
    
    [self.begin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 20));
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);

    }];
    
    [self.top2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(50);
        
    }];
}


@end

NS_ASSUME_NONNULL_END
