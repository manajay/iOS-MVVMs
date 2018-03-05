//
//  LJHomeSubjectDataController.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeSubjectDataController.h"

@implementation LJHomeSubjectDataController

- (void)requestAvatarDataWithCallback:(HomeAvatarCallback)callback{
    NSLog(@"LJHomeSubjectDataController - requestAvatarDataWithCallback");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *array = @[
                         @{@"title": @"one",
                           @"url": @"soilder"},
                         @{@"title": @"two",
                           @"url": @"police"}];
        self.avatars = [HomeAvatarModel modelsWithDictArray:array];
        callback(nil);
    });
}

@end
