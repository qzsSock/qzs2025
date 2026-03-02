//
//  CNASpecialModel.h
//  qzs2025
//
//  Created by qiuzishuo on 2025/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface CNASAddPart : NSObject

@property (nonatomic,strong) NSString*fileCode;
@property (nonatomic,strong) NSString*fileName;

@end

@interface RecordInformationVoModel : NSObject


@property (nonatomic,strong) NSArray<CNASAddPart*>*addPart;
@property (nonatomic,strong) NSString*administrativePenaltyContent;
@property (nonatomic,strong) NSString*investigativeAgency;
@property (nonatomic,strong) NSString*investigativeAgencyCode;
@property (nonatomic,strong) NSString*processingStatus;
@property (nonatomic,strong) NSString*procuratorate;
@property (nonatomic,strong) NSString*procuratorateCode;
@end


@interface CaseSuspectsListVosModel : NSObject


@property (nonatomic,strong) NSString*compulsoryMeasures;
@property (nonatomic,strong) NSString*compulsoryMeasuresCode;
@property (nonatomic,strong) NSString*criminalRecord;
@property (nonatomic,strong) NSString*idNo;
@property (nonatomic,strong) NSString*idType;
@property (nonatomic,strong) NSString*idTypeStr;
@property (nonatomic,strong) NSString*personName;

@end

@interface CaseNotificationProcessVoModel : NSObject

@property (nonatomic,strong) NSString*businessId;
@property (nonatomic,strong) NSString*opinionsOfTheProcuratorate;

@property (nonatomic,strong) NSArray<CNASAddPart*>*addPart;

@end


@interface CNASpecialModel : NSObject



@property (nonatomic,strong) NSString*discussPersons;

@property (nonatomic,strong) NSString*baseCaseDetail;
@property (nonatomic,strong) NSString*caseName;
@property (nonatomic,strong) CaseNotificationProcessVoModel*caseNotificationProcessVo;
@property (nonatomic,strong) NSString*caseReason;
@property (nonatomic,strong) NSArray<CaseSuspectsListVosModel*>*caseSuspectsListVos;

@property (nonatomic,strong) NSString*caseSuspectsListStr;


@property (nonatomic,strong) NSString*caseTypeName;
@property (nonatomic,strong) NSString*filingDate;
@property (nonatomic,strong) NSString*investigativeAgency;
@property (nonatomic,strong) NSString*investigativeAgencyCode;
@property (nonatomic,strong) NSString*personCode;
@property (nonatomic,strong) NSString*personName;
@property (nonatomic,strong) NSString*procuratorate;
@property (nonatomic,strong) NSString*procuratorateCode;
@property (nonatomic,strong) RecordInformationVoModel*recordInformationVo;



//caseNotificationProcessVo =         {
//    addPart =             (
//    );
//};




//recordInformationVo =         {
//    addPart =             (
//                        {
//            fileCode = 8162606060030175377;
//            fileName = "02-flex\U5e03\U5c40.pdf";
//        }
//    );
//     = 1;
//     = "\U6d4b\U8bd5\U767e\U8111\U6c47\U5927\U961f";
//     = 2832513763568422585;
//     = 1;
//     = "\U6d4b\U8bd5\U5e02\U7ea7\U68c0\U5bdf\U96621";
//     = 002014001;
//};
@end

NS_ASSUME_NONNULL_END
