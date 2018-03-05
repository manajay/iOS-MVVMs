//
//  LJHomeAvatarViewModel.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeAvatarViewModel.h"

@interface LJHomeAvatarViewModel()
@property(nonatomic, strong, readwrite) UIImage * avatar;
@property(nonatomic, copy, readwrite) NSString * text;
@end

@implementation LJHomeAvatarViewModel

- (instancetype)initWithModel:(HomeAvatarModel *)model{
    self.text = model.title;
    // 这里只是简单的本地加载图片, 一般用图片组件,异步加载
    self.avatar = [UIImage imageNamed:model.url];
    NSLog(@"cell viewModel: %@, model.title: %@", self, model.title);
    return self;
}

+ (instancetype)ViewModelWithModel:(HomeAvatarModel *)model{
    LJHomeAvatarViewModel *viewModel = [[self alloc] initWithModel: model];
    return viewModel;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"image size: %@, text: %@", NSStringFromCGSize(self.avatar.size), self.text];
}
@end
