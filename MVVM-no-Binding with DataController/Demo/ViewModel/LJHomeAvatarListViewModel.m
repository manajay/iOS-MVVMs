//
//  LJHomeAvatarListViewModel.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeAvatarListViewModel.h"

@implementation LJHomeAvatarListViewModel
+ (instancetype)viewModelWithAvatars:(NSArray<HomeAvatarModel *> *)avatars{
    LJHomeAvatarListViewModel *viewModel = [[self alloc] init];
    NSMutableArray<LJHomeAvatarViewModel *> *cellViewModels = [NSMutableArray arrayWithCapacity:avatars.count];
    LJHomeAvatarViewModel *cellViewModel = nil;
    for (HomeAvatarModel *avatarModel in avatars) {
        cellViewModel = [LJHomeAvatarViewModel ViewModelWithModel:avatarModel];
        [cellViewModels addObject:cellViewModel];
    }
    viewModel.cellViewModels = cellViewModels.copy;
    return viewModel;
}
@end
