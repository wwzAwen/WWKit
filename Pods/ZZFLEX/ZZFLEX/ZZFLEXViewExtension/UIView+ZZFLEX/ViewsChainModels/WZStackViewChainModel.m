//
//  WZStackViewChainModel.m
//  Masonry
//
//  Created by 王文照 on 2020/7/23.
//

#import "WZStackViewChainModel.h"

#define     ZZFLEX_CHAIN_STACKVIEW_IMPLEMENTATION(methodName, ZZParamType)      ZZFLEX_CHAIN_IMPLEMENTATION(methodName, ZZParamType, WZStackViewChainModel *, UIStackView)

@implementation WZStackViewChainModel
ZZFLEX_CHAIN_STACKVIEW_IMPLEMENTATION(spacing, CGFloat);
ZZFLEX_CHAIN_STACKVIEW_IMPLEMENTATION(alignment, UIStackViewAlignment)
ZZFLEX_CHAIN_STACKVIEW_IMPLEMENTATION(distribution, UIStackViewDistribution)
ZZFLEX_CHAIN_STACKVIEW_IMPLEMENTATION(axis, UILayoutConstraintAxis)
@end

ZZFLEX_EX_IMPLEMENTATION(UIStackView, WZStackViewChainModel);
