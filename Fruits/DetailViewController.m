//
//  DetailViewController.m
//  Fruits
//
//  Created by hawa.singh.kumawat on 13/01/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemViewController.h"

@interface DetailViewController ()
@property(nonatomic,assign)int currentPage;
@property(nonatomic,strong)NSMutableArray* itemVCArray;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   if(_itemList && _itemList.count){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       _itemVCArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<_itemList.count; i++) {
            NSString* item = [_itemList objectAtIndex:i];
            
            ItemViewController* itemVC = (ItemViewController*)[storyboard instantiateViewControllerWithIdentifier:@"ItemViewController"];
            itemVC.itemName = item;
            itemVC.itemImageName = item;
            
            CGRect itemFrame = itemVC.view.frame;
            itemVC.view.frame = CGRectMake(i*itemFrame.size.width, itemFrame.origin.y, itemFrame.size.width, itemFrame.size.height);
            
            CGSize containerViewSize = _containerView.contentSize;
            containerViewSize = CGSizeMake((i == 0)?containerViewSize.width:(i+1)*itemVC.view.frame.size.width, containerViewSize.height);
            _containerView.contentSize = containerViewSize;
            [_containerView addSubview:itemVC.view];
            [_itemVCArray addObject:itemVC];
            
        }
    }
    
    self.nextBtn.hidden = (_itemList.count>1)?NO:YES;
    _containerView.delaysContentTouches = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     // Update the page when more than 50% of the previous/next page is visible
    [self updatePage];
}

- (void)updatePage
{
    CGFloat pageWidth = _containerView.frame.size.width;
    int page = floor((_containerView.contentOffset.x - pageWidth / 2) / pageWidth)+1;
    
    if(page != self.currentPage)
    {
//        self.backBtn.hidden = YES;
//        self.nextBtn.hidden = YES;
//        self.previousBtn.hidden = YES;
        
        self.currentPage = page;
        [self performSelector:@selector(animateContainer:) withObject:nil afterDelay:0.2];
    }
}

-(void)animateContainer:(id)sender
{
    /*** ANIMATION TYPE 1 ****/
    
    CGFloat factors[36] = {0, 40, 80, 100, 120, 150,160, 170,175, 180, 180,175, 170, 160,150, 120, 100, 80, 40,
        0, 24, 42, 54, 62, 64, 62, 54, 42, 24, 0, 18, 28, 32, 28, 18, 0};
    NSMutableArray *values = [NSMutableArray array];
    for (int i=0; i<36; i++)
    {
        CGFloat positionOffset = factors[i]/512.0f * 100;
        CATransform3D transform = CATransform3DMakeTranslation(-positionOffset,0, 0);
        [values addObject:[NSValue valueWithCATransform3D:transform]];
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount = 1;
    animation.duration = 1;
    animation.fillMode = kCAFillModeForwards;
    animation.values = values;
    animation.removedOnCompletion = YES; // final stage is equal to starting stage
    animation.autoreverses = NO;
    animation.delegate = self;
    
    [_containerView.layer addAnimation:animation forKey:nil];

    
    self.backBtn.hidden = NO;
    self.nextBtn.hidden = (self.currentPage < (_itemList.count-1))?NO:YES;
    self.previousBtn.hidden = (self.currentPage != 0)?NO:YES;
    
    
    /*** ANIMATION TYPE 2 ****/
    
//    [UIView animateWithDuration:0.50
//                          delay:0.0
//                        options: (UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat|UIViewAnimationCurveEaseInOut)
//                     animations:^{
//                         [UIView setAnimationRepeatCount:1];
//                         _containerView.transform = CGAffineTransformMakeScale(1.2,1.2);
//                         
//                     }
//                     completion:^(BOOL finished){
//                         _containerView.transform = CGAffineTransformIdentity;
//                         self.backBtn.hidden = NO;
//                         
//                         self.nextBtn.hidden = (self.currentPage < (_itemList.count-1))?NO:YES;
//                         self.previousBtn.hidden = (self.currentPage != 0)?NO:YES;
//                     }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [UIView animateWithDuration:0.50
                          delay:0.0
                        options: (UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat|UIViewAnimationCurveEaseInOut)
                     animations:^{
                         [UIView setAnimationRepeatCount:1];
                        ((UILabel*)[(ItemViewController*)[_itemVCArray objectAtIndex:self.currentPage] itemNameLbl]).transform = CGAffineTransformMakeScale(1.5,1.5);

                     }
                     completion:^(BOOL finished){
                         ((UILabel*)[(ItemViewController*)[_itemVCArray objectAtIndex:self.currentPage] itemNameLbl]).transform = CGAffineTransformIdentity;
                     }];

}

- (IBAction)goBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)gotoNextItem:(UIButton *)sender
{
    CGFloat x = _containerView.frame.size.width * (self.currentPage+1);
    [_containerView setContentOffset:CGPointMake(x, 0) animated:NO];
    
    [self updatePage];
}

- (IBAction)gotoPreviousItem:(UIButton *)sender
{
    CGFloat x = _containerView.frame.size.width * (self.currentPage-1);
    [_containerView setContentOffset:CGPointMake(x, 0) animated:NO];
    
    [self updatePage];
}

@end
