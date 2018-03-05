//
//  LJHomeDataController.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeDataController.h"
#import "LJHomeSubjectDataController.h"

@interface LJHomeDataController ()
@property(nonatomic, strong, nonnull, readwrite) NSArray<HomeAvatarModel *> *avatars;
/** 负责请求数据 */
@property(nonatomic, strong, nonnull, readwrite) LJHomeSubjectDataController *subjectDataController;
@end

@implementation LJHomeDataController

- (instancetype)init {
    self = [super init];
    if (self) {
        _subjectDataController = [[LJHomeSubjectDataController alloc] init];
    }
    return self;
}

- (void)requestAvatarDataWithCallback:(HomeCompletionCallback)callback{
    NSLog(@"LJHomeDataController - requestAvatarDataWithCallback");
    
    HomeAvatarCallback dataCallback = ^(NSError * error){
        NSLog(@"主要数据 error: %@",error);
        if (error == nil) {
            // 网络请求
            // 异步回调
            if (callback != nil) {
                //没有error
                callback(nil);
            }
        }
    };
    
    [self.subjectDataController requestAvatarDataWithCallback:dataCallback];
}

-(NSArray<HomeAvatarModel *> *)avatars{
    return self.subjectDataController.avatars ?: @[];
}

@end
