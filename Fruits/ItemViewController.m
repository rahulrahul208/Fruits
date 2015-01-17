//
//  ItemViewController.m
//  Fruits
//
//  Created by hawa.singh.kumawat on 13/01/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemNameLbl.text = _itemName;
    self.itemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",_itemImageName]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
