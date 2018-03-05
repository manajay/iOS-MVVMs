//
//  LJHomeDataController.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAvatarModel.h"

typedef void(^HomeCompletionCallback)(NSError *);

/** 负责请求处理数据*/
@interface LJHomeDataController : UIViewController

/** 头像列表数组*/
@property(nonatomic, strong, nonnull,readonly) NSArray<HomeAvatarModel *> *avatars;

/** 获取头像数据*/
- (void)requestAvatarDataWithCallback:(HomeCompletionCallback)callback;

@end
