//
//  ZZFLEXAngel+Private.h
//  ZZFLEXDemo
//
//  Created by lbk on 2017/12/14.
//  Copyright © 2017年 lbk. All rights reserved.
//

#import "ZZFLEXAngel.h"
#import "ZZFlexibleLayoutSectionModel.h"
#import "ZZFlexibleLayoutViewModel.h"
@interface ZZFLEXAngel (Private)

- (ZZFlexibleLayoutSectionModel *)sectionModelAtIndex:(NSInteger)section;

- (ZZFlexibleLayoutSectionModel *)sectionModelForTag:(NSInteger)sectionTag;

- (ZZFlexibleLayoutViewModel *)viewModelAtIndexPath:(NSIndexPath *)indexPath;

@end
