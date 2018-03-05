//
//  LJHomeAvatarListViewModel.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeAvatarModel.h"
#import "LJHomeAvatarViewModel.h"

@interface LJHomeAvatarListViewModel : NSObject

@property (nonatomic, strong, nonnull) NSArray<LJHomeAvatarViewModel *> *cellViewModels;

+ (instancetype)viewModelWithAvatars:(NSArray<HomeAvatarModel *> *)avatars;

@end
