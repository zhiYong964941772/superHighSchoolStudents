//
//  ZYProfessionCollectionView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYProfessionCollectionView.h"
#import "ZYProfessionCollectionViewCell.h"
@interface ZYProfessionCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation ZYProfessionCollectionView
+ (instancetype)showProfessionCollectionView:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat itemWidth = frame.size.height*0.5;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    layout.minimumLineSpacing = 0;
    ZYProfessionCollectionView *collection = [[ZYProfessionCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    
    return collection;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[ZYProfessionCollectionViewCell class] forCellWithReuseIdentifier:@"ZYProfessionCollectionViewCell"];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ProfessionCollectViewHeader"];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYProfessionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYProfessionCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ZYProfessionCollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.5, 200)];
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ProfessionCollectViewHeader" forIndexPath:indexPath];
        
        UILabel *titleLB = [UILabel makeLabel:^(UILabel *label) {
            [headerView addSubview:label];
            label.addTextFont(16).addText(@"精选");
            [label setTextAlignment:NSTextAlignmentCenter];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(headerView.mas_centerX);
                make.centerY.mas_equalTo(headerView.mas_centerY);
                make.width.mas_equalTo(40);
            }];
        }];
        [UIImageView makeImage:^(UIImageView * _Nullable imageView) {
            [headerView addSubview:imageView];
            imageView.addColor([UIColor grayColor]);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(titleLB.mas_bottom);
                make.centerX.mas_equalTo(headerView.mas_centerX);
                make.left.mas_equalTo(titleLB.mas_left);
                make.right.mas_equalTo(titleLB.mas_right);
                
                make.height.mas_equalTo(1);
            }];
        }];
        return headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 44);
}

@end
