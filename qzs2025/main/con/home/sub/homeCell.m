//
//  homeCell.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/10/1.
//

#import "homeCell.h"

NS_ASSUME_NONNULL_BEGIN

@implementation homeCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        self.requiredLabel = [UILabel initWithtextColor:[UIColor colorWithHexString:@"#E02020"] font:17 textAlignment:NSTextAlignmentCenter numberOfLines:1 text:@"*"];
        //               [self addSubview:self.requiredLabel];
        //
        //        self.leftLabel = [UILabel initWithtextColor:[UIColor colorWithHexString:@"#191F25"] font:17 textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"11"];
        //        [self.contentView addSubview:self.leftLabel];
        //
        //        self.textField = [[UITextField alloc] init];
        //        self.textField.textAlignment = NSTextAlignmentRight;
        //        self.textField.textColor = [UIColor colorWithHexString:@"#303030"];
        //        self.textField.font = [UIFont systemFontOfSize:14];
        //        [self.contentView addSubview:self.textField];
        
        self.arrow = [[UIImageView alloc] initWithImage:ImageWithName(@"home_img_banner")];
        [self.contentView addSubview:self.arrow];
        
        
        self.requiredLabel = [UILabel initWithtextColor:[UIColor colorWithHexString:@"#E02020"] font:30 textAlignment:NSTextAlignmentCenter numberOfLines:1 text:@"*"];
        [self addSubview:self.requiredLabel];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.requiredLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(self);
    }];
    //
    //    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(23);
    //           make.centerY.mas_equalTo(self);
    //       }];
    //
    //    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
    //                  make.right.mas_equalTo(-15);
    //                  make.centerY.mas_equalTo(self);
    //    }];
    //
    //    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
    //              make.right.mas_equalTo(-30);
    //             make.left.mas_equalTo(120);
    //              make.centerY.mas_equalTo(self);
    //          }];
    
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        
    }];
    
    
    
}




@end

NS_ASSUME_NONNULL_END
