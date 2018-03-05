//
//  LJHomeSubjectDataController.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAvatarModel.h"

typedef void(^HomeAvatarCallback)(NSError *);

@interface LJHomeSubjectDataController : UIViewController
@property(nonatomic, strong, nonnull, readwrite) NSArray<HomeAvatarModel *> *avatars;

- (void)requestAvatarDataWithCallback:(HomeAvatarCallback)callback;

@end
