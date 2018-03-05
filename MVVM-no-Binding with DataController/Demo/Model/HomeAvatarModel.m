//
//  HomeAvatarModel.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "HomeAvatarModel.h"

@interface HomeAvatarModel()
@property(nonatomic, copy, readwrite) NSString * url;
@property(nonatomic, copy, readwrite) NSString * title;
@end

@implementation HomeAvatarModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    self.url = dict[@"url"];
    self.title = dict[@"title"];
    NSLog(@"avatar model: %@, dict: %@", self, dict);
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    HomeAvatarModel* obj = [[self alloc] initWithDict:dict];
    return obj;
}

+ (NSArray<HomeAvatarModel*> *)modelsWithDictArray:(NSArray *)dictArr{
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:dictArr.count];
    HomeAvatarModel *model = nil;
    for (NSDictionary *dict in dictArr) {
        model = [HomeAvatarModel modelWithDict:dict];
        [mArr addObject:model];
    }
    return mArr.copy;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"image url: %@, text: %@", self.url, self.title];
}
@end
