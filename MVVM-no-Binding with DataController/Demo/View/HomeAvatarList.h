//
//  HomeAvatarList.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJHomeAvatarListViewModel.h"
@class HomeAvatarList;

@protocol HomeAvatarListDelegate <NSObject>
- (void)homeSubjectView:(nonnull HomeAvatarList *)subjectView
    didPressItemAtIndex:(NSInteger)index;
@end

@interface HomeAvatarList : UIView
@property (nonatomic, weak, nullable) id<HomeAvatarListDelegate> delegate;
@property (nonatomic, strong, nullable, readonly) LJHomeAvatarListViewModel *viewModel;

- (void)bindDataWithViewModel:(LJHomeAvatarListViewModel *)viewModel;

@end
