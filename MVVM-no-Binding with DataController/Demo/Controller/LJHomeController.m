//
//  LJHomeController.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "LJHomeController.h"
#import "LJDimensionConst.h"
#import "HomeAvatarList.h"
#import "LJHomeDataController.h"
#import "LJHomeAvatarListViewModel.h"

#define TITLE_HEIGHT 30
#define TITLE_WIDTH 200

#define ITEM_WIDTH  (LJSCREEN_WIDTH * 0.2)

@interface LJHomeController ()<UITableViewDelegate>

@property(nonatomic, strong, nonnull) UIScrollView *contentView;

@property(nonatomic, strong, nonnull) UILabel *titleLbl;

@property(nonatomic, strong, nonnull) HomeAvatarList *avatarListView;

@property(nonatomic, strong, nonnull) LJHomeDataController *dataController;


@end

@implementation LJHomeController

#pragma View LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupUI];
    [self fetchSubjectData];
}

#pragma init

- (void)setupUI{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.contentView];
    
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.avatarListView];
    
}

- (void)initData{
    self.dataController = [[LJHomeDataController alloc] init];
}

#pragma data request

- (void)fetchSubjectData {
    [self.dataController requestAvatarDataWithCallback:^(NSError * error) {
        if (error == nil) {
            [self renderSubjectView];
        } else {
            NSLog(@"fetchSubjectData, error: %@",error);
        }
    }];
}

- (void)renderSubjectView {
    LJHomeAvatarListViewModel *viewModel =
    [LJHomeAvatarListViewModel viewModelWithAvatars:self.dataController.avatars];
    [self.avatarListView bindDataWithViewModel:viewModel];
}

#pragma Action


#pragma getter

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, LJSCREEN_WIDTH, LJSCREEN_HEIGHT)];
        _contentView.contentSize = CGSizeMake(LJSCREEN_WIDTH, LJSCREEN_HEIGHT * 2);
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}

- (UILabel *)titleLbl{
    if (_titleLbl == nil) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.text = @"https://manajay.com";
        _titleLbl.textColor = [UIColor blueColor];
        _titleLbl.font = [UIFont systemFontOfSize: 20];
        _titleLbl.frame = CGRectMake((LJSCREEN_WIDTH - TITLE_WIDTH) * 0.5, 20, TITLE_WIDTH, TITLE_HEIGHT);
    }
    return _titleLbl;
}

- (HomeAvatarList *)avatarListView{
    if (_avatarListView == nil) {
        CGRect rect = CGRectMake(0,CGRectGetMaxY(self.titleLbl.frame) + 20, LJSCREEN_WIDTH, LJSCREEN_HEIGHT - CGRectGetMaxY(self.titleLbl.frame) - 20);
        _avatarListView = [[HomeAvatarList alloc] initWithFrame:rect];
    }
    return _avatarListView;
}

@end
