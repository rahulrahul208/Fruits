//
//  DetailViewController.h
//  Fruits
//
//  Created by hawa.singh.kumawat on 13/01/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (strong, nonatomic) NSArray* itemList;

- (IBAction)goBack:(UIButton *)sender;
- (IBAction)gotoNextItem:(UIButton *)sender;
- (IBAction)gotoPreviousItem:(UIButton *)sender;

@end
