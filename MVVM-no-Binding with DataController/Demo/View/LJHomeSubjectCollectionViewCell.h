//
//  LJHomeSubjectCollectionViewCell.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJHomeAvatarViewModel.h"

@interface LJHomeSubjectCollectionViewCell : UICollectionViewCell
- (void)bindDataWithViewModel:(nonnull LJHomeAvatarViewModel *)viewModel;
@end
