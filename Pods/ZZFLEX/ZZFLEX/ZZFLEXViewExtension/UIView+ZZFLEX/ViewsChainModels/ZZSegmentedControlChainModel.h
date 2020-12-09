//
//  ZZSegmentedControlChainModel.h
//  DoraemonKit
//
//  Created by 王文照 on 2020/11/23.
//

#import "ZZControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZSegmentedControlChainModel : ZZControlChainModel

ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ momentary)(BOOL momentary);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ apportionsSegmentWidthsByContent)(BOOL apportionsSegmentWidthsByContent);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ selectedSegmentIndex)(int selectedSegmentIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ selectedSegmentTintColor)(UIColor *selectedSegmentTintColor);

ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setImage)(UIImage *image, NSInteger AtIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ insertImage)(UIImage *image, NSInteger AtIndex, BOOL animated);

ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setTitle)(NSString *title, NSInteger AtIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ insertTitle)(NSString *title, NSInteger AtIndex, BOOL animated);

ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setAction)(UIAction *action, NSInteger AtIndex) API_AVAILABLE(ios(14.0));
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ insertAction)(UIAction *action, NSInteger AtIndex, BOOL animated) API_AVAILABLE(ios(14.0));

ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setWidth)(CGFloat width, NSInteger AtIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setContentOffset)(CGSize offset, NSInteger AtIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ setEnabledAtIndex)(BOOL enabeld, NSInteger AtIndex);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ removeSegment)(NSUInteger segment, BOOL animated);
ZZFLEX_CHAIN_PROPERTY ZZSegmentedControlChainModel *(^ removeAllSegments)(void);
@end

NS_ASSUME_NONNULL_END

ZZFLEX_EX_INTERFACE(UISegmentedControl, ZZSegmentedControlChainModel);
