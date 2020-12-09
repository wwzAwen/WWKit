//
//  WZStackViewChainModel.h
//  Masonry
//
//  Created by 王文照 on 2020/7/23.
//

#import "ZZBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class WZStackViewChainModel;
API_AVAILABLE(ios(9.0))
@interface WZStackViewChainModel : ZZBaseViewChainModel<WZStackViewChainModel *>
ZZFLEX_CHAIN_PROPERTY WZStackViewChainModel *(^ axis)(UILayoutConstraintAxis axis);
ZZFLEX_CHAIN_PROPERTY WZStackViewChainModel *(^ distribution)(UIStackViewDistribution distribution);
ZZFLEX_CHAIN_PROPERTY WZStackViewChainModel *(^ alignment)(UIStackViewAlignment alignment);
ZZFLEX_CHAIN_PROPERTY WZStackViewChainModel *(^ spacing)(CGFloat spacing);
@end

ZZFLEX_EX_INTERFACE(UIStackView, WZStackViewChainModel)

NS_ASSUME_NONNULL_END


