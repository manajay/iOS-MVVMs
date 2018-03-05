//
//  HomeAvatarModel.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeAvatarModel : NSObject
@property(nonatomic, copy, readonly) NSString * url;
@property(nonatomic, copy, readonly) NSString * title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
+ (NSArray<HomeAvatarModel*> *)modelsWithDictArray:(NSArray *)dictArr;
@end
