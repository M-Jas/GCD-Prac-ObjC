//
//  ViewController.m
//  GCD-Prac-ObjC
//
//  Created by DetroitLabs on 8/19/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSOperationQueue *myQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
}


- (void)viewWillAppear:(BOOL)animated {
    [self test2];
}

- (void)viewDidAppear:(BOOL)animated {
    [self test3];
}

- (void)test1 {
    NSLog(@"LOG 1 $$$$$$$$$$$$$$$$$$$$$");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"ALPHA **********************");
    });
    
    NSLog(@"LOG 2 $$$$$$$$$$$$$$$$$$$$$");
}


- (void)test2 {
    NSLog(@"LOG 3 $$$$$$$$$$$$$$$$$$$$$");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"LOG 4 $$$$$$$$$$$$$$$$$$$$$");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"BETA************************");
        });
        NSLog(@"LOG 5 $$$$$$$$$$$$$$$$$$$$$");
    });
    
    NSLog(@"LOG 6 $$$$$$$$$$$$$$$$$$$$$");
}


- (void)test3 {
    NSLog(@"LOG 7 $$$$$$$$$$$$$$$$$$$$$");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"LOG 8 $$$$$$$$$$$$$$$$$$$$$");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"Gamma************************");
        });
        NSLog(@"LOG 9 $$$$$$$$$$$$$$$$$$$$$");
    });
    
    NSLog(@"LOG 10 $$$$$$$$$$$$$$$$$$$$$");
}


//- (void)operationTest {
//    NSBlockOperation * op1 = [[NSBlockOperation alloc]init];
//    
//}





@end
