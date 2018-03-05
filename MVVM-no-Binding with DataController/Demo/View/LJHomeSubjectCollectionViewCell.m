//
//  LJHomeSubjectCollectionViewCell.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeSubjectCollectionViewCell.h"

@interface LJHomeSubjectCollectionViewCell()
@property(nonatomic, strong, nonnull) UIImageView *imageView;
@property(nonatomic, strong, nonnull) UILabel *titleLbl;

@end

@implementation LJHomeSubjectCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLbl];
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentView.layer.borderWidth = 5;

}

- (void)bindDataWithViewModel:(nonnull LJHomeAvatarViewModel *)viewModel{
    self.imageView.image = viewModel.avatar;
    self.titleLbl.text = viewModel.text;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    }
    return _imageView;
}

-(UILabel *)titleLbl{
    if (_titleLbl == nil) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.center = self.center;
        _titleLbl.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        [_titleLbl setFont: [UIFont systemFontOfSize:13]];
    }
    return _titleLbl;
}

@end
