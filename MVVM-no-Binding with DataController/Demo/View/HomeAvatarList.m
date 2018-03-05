//
//  HomeAvatarList.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "HomeAvatarList.h"
#import "LJDimensionConst.h"
#import "LJHomeSubjectCollectionViewCell.h"
#define LJHomeSubjectCollectionViewCellIdentifier @"LJHomeSubjectCollectionViewCellIdentifier"
#define ITEM_WIDTH  (LJSCREEN_WIDTH * 0.2)

@interface HomeAvatarList ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@property(nonatomic, strong, readwrite) LJHomeAvatarListViewModel *viewModel;

@end

@implementation HomeAvatarList

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.collectionView];
    self.backgroundColor = [UIColor greenColor];
}

- (void)bindDataWithViewModel:(LJHomeAvatarListViewModel *)viewModel{
    self.viewModel = viewModel;
    [self.collectionView reloadData];
    [self setNeedsUpdateConstraints];
}

#pragma UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.cellViewModels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (0 <= indexPath.row && indexPath.row < self.viewModel.cellViewModels.count) {
        LJHomeAvatarViewModel *cellViewModel = self.viewModel.cellViewModels[indexPath.item];
        LJHomeSubjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LJHomeSubjectCollectionViewCellIdentifier forIndexPath:indexPath];
        [cell bindDataWithViewModel:cellViewModel];
        return cell;
    }
    return nil;
}

#pragma UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了CELL");
    if ([self.delegate respondsToSelector:@selector(homeSubjectView:didPressItemAtIndex:)]) {
        [self.delegate homeSubjectView:self didPressItemAtIndex:indexPath.item];
        NSLog(@"点击了CELL,交给代理处理");
    }
}

-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(ITEM_WIDTH, ITEM_WIDTH);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor yellowColor];
        [_collectionView registerClass:[LJHomeSubjectCollectionViewCell class] forCellWithReuseIdentifier:LJHomeSubjectCollectionViewCellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
