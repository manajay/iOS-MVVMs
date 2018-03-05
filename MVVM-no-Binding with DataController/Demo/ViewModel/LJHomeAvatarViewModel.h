//
//  LJHomeAvatarViewModel.h
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAvatarModel.h"

@interface LJHomeAvatarViewModel : NSObject
@property(nonatomic, strong, readonly) UIImage * avatar;
@property(nonatomic, copy, readonly) NSString * text;

+ (instancetype)ViewModelWithModel:(HomeAvatarModel *)model;
@end
