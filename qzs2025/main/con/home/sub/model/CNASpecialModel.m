//
//  CNASpecialModel.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/28.
//

#import "CNASpecialModel.h"

NS_ASSUME_NONNULL_BEGIN
@implementation CNASAddPart

@end

@implementation RecordInformationVoModel
//@property (nonatomic,strong) NSArray<CNASAddPart*>*addPart;


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"addPart" : [CNASAddPart class]};//前边，是属性数组的名字，后边就是类名
}



@end

@implementation CaseSuspectsListVosModel

@end


@implementation CaseNotificationProcessVoModel
//@property (nonatomic,strong) NSArray<CNASAddPart*>*addPart;

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"addPart" : [CNASAddPart class]};//前边，是属性数组的名字，后边就是类名
}

@end

@implementation CNASpecialModel
//@property (nonatomic,strong) NSArray<CaseSuspectsListVosModel*>*caseSuspectsListVos;

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"caseSuspectsListVos" : [CaseSuspectsListVosModel class]};//前边，是属性数组的名字，后边就是类名
}
@end

NS_ASSUME_NONNULL_END
