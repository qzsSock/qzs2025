#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "back" asset catalog image resource.
static NSString * const ACImageNameBack AC_SWIFT_PRIVATE = @"back";

/// The "back_white" asset catalog image resource.
static NSString * const ACImageNameBackWhite AC_SWIFT_PRIVATE = @"back_white";

/// The "tab_home" asset catalog image resource.
static NSString * const ACImageNameTabHome AC_SWIFT_PRIVATE = @"tab_home";

/// The "tab_jianwugongkai" asset catalog image resource.
static NSString * const ACImageNameTabJianwugongkai AC_SWIFT_PRIVATE = @"tab_jianwugongkai";

/// The "tab_my" asset catalog image resource.
static NSString * const ACImageNameTabMy AC_SWIFT_PRIVATE = @"tab_my";

/// The "tab_select_home" asset catalog image resource.
static NSString * const ACImageNameTabSelectHome AC_SWIFT_PRIVATE = @"tab_select_home";

/// The "tab_select_jianwugongkai" asset catalog image resource.
static NSString * const ACImageNameTabSelectJianwugongkai AC_SWIFT_PRIVATE = @"tab_select_jianwugongkai";

/// The "tab_select_my" asset catalog image resource.
static NSString * const ACImageNameTabSelectMy AC_SWIFT_PRIVATE = @"tab_select_my";

/// The "tab_select_xinfang" asset catalog image resource.
static NSString * const ACImageNameTabSelectXinfang AC_SWIFT_PRIVATE = @"tab_select_xinfang";

/// The "tab_select_zhejian" asset catalog image resource.
static NSString * const ACImageNameTabSelectZhejian AC_SWIFT_PRIVATE = @"tab_select_zhejian";

/// The "tab_xinfang" asset catalog image resource.
static NSString * const ACImageNameTabXinfang AC_SWIFT_PRIVATE = @"tab_xinfang";

/// The "tab_zhejian" asset catalog image resource.
static NSString * const ACImageNameTabZhejian AC_SWIFT_PRIVATE = @"tab_zhejian";

/// The "work_normal" asset catalog image resource.
static NSString * const ACImageNameWorkNormal AC_SWIFT_PRIVATE = @"work_normal";

/// The "work_select" asset catalog image resource.
static NSString * const ACImageNameWorkSelect AC_SWIFT_PRIVATE = @"work_select";

#undef AC_SWIFT_PRIVATE
