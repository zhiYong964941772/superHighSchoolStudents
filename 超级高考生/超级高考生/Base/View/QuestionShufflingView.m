//
//  QuestionShufflingView.m
//  Dragons
//
//  Created by work on 16/4/18.
//  Copyright © 2016年 allimu. All rights reserved.
//

#import "QuestionShufflingView.h"

@interface QuestionShufflingView()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSInteger _count;
    NSTimer *_timer;
    CGFloat _selfHeight;
    CGFloat _selfWidth;
}
@end
@implementation QuestionShufflingView
+(instancetype)getShuffingView:(CGRect)shuffyFrame{
    
    return [[self alloc]initWithFrame:shuffyFrame];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        _selfHeight = self.frame.size.height;
        _selfWidth = self.frame.size.width;
        
    }
    return self;
}
- (UIScrollView *)loadScrollView{
   
    UIScrollView *scrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _selfWidth, _selfHeight)];
    scrol.showsVerticalScrollIndicator = NO;
    scrol.showsHorizontalScrollIndicator = NO;
    scrol.bounces = NO;
    scrol.pagingEnabled = YES;
    scrol.delegate =self;
    
    [scrol setContentOffset:CGPointMake(_selfWidth, 0)];
    return scrol;
   }
- (void)setImageArr:(NSArray *)imageArr{
    _scrollView =  [self loadScrollView];
    _imageArr = imageArr;
    _count = imageArr.count;
    if (imageArr.count==0) return;
    for (int i = 0; i<_count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake((i+1)*_selfWidth, 0, _selfWidth,_selfHeight)];
        [image setBackgroundColor:BASECOLORL(150, 150, 150)];
        if ([imageArr[i]hasPrefix:@"http"]||[imageArr[i]hasPrefix:@"https"] ) {
//            [image sd_setImageWithURL:[NSURL URLWithString:imageArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        }else{
            image.image = [UIImage imageNamed:imageArr[i]];
        }
        [_scrollView addSubview:image];
    }
    UIImageView *lastImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArr[_count-1]]];
    lastImage.frame = CGRectMake(0, 0, _selfWidth, _selfHeight);
    [_scrollView addSubview:lastImage];
    UIImageView *fristImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArr[0]]];
    fristImage.frame = CGRectMake(_selfWidth*(_count+1), 0, _selfWidth, _selfHeight);
    [_scrollView addSubview:fristImage];
    _scrollView.contentSize = CGSizeMake((_count+2) * self.bounds.size.width, 0);
    _pageControl = [self loadPageControl];
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    [self loadTimer];

}
- (void)loadTimer{
    if (_timer)return;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollViewDragging:) userInfo:nil repeats:YES];
    
}
- (void)scrollViewDragging:(NSTimer *)timer{
    
    NSInteger currentPage = _pageControl.currentPage;
    currentPage++;
    currentPage = currentPage>(_count-1)?0:currentPage;
    _pageControl.currentPage = currentPage;
    [_scrollView setContentOffset:CGPointMake(_selfWidth*(currentPage+1), 0)];


}
#pragma mark -- 因为是从第二张图开始的
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/_selfWidth;
    page--;
    _pageControl.currentPage = page;
}
- (void)setPageFrame:(CGRect)pageFrame{
    _pageFrame = pageFrame;
    _pageControl.frame = pageFrame;
}
- (UIPageControl *)loadPageControl{
    UIPageControl *page = [[UIPageControl alloc]init];
    page.userInteractionEnabled = YES;
   
    CGPoint center = _scrollView.center;
    center.y = _selfHeight -10;
    center.x = _selfWidth - 50;
    page.center = center;

    page.numberOfPages = _count;
    [page setCurrentPage:0];
    [page setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [page setPageIndicatorTintColor:[UIColor blackColor]];
    return page;
    
}
#pragma mark -- 手势滑动事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGPoint scrollViewP = scrollView.contentOffset;
    NSInteger currentPage = scrollViewP.x/_selfWidth;
    if (currentPage == 0) {
     
        [_scrollView setContentOffset:CGPointMake(_selfWidth*_count, 0)];


    }else if(currentPage == (_count+1)){
        [_scrollView setContentOffset:CGPointMake(_selfWidth, 0)];

    }
}
- (void)hideShuffing{
    
    [_timer invalidate];
    _timer = nil;
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
   
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    

       [self loadTimer];
}
@end
