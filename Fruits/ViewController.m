//
//  ViewController.m
//  Fruits
//
//  Created by hawa.singh.kumawat on 13/01/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showFruits"]){
        DetailViewController* detailViewController = (DetailViewController*)[segue destinationViewController];
        NSArray* fruits = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R", nil];
        detailViewController.itemList = fruits;
    }
}


@end
