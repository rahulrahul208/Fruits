//
//  ItemViewController.h
//  Fruits
//
//  Created by hawa.singh.kumawat on 13/01/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLbl;
@property (strong, nonatomic) NSString* itemName;
@property (strong, nonatomic) NSString* itemImageName;


@end
