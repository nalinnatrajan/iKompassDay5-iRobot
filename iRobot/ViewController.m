//
//  ViewController.m
//  iRobot
//
//  Created by Nalin Natrajan on 7/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *theFuture;

@property (weak, nonatomic) IBOutlet UILabel *thePast;

@end

@implementation ViewController

@synthesize center, rect;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.center = self.theFuture.center;
    self.rect = self.theFuture.frame;
}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    self.theFuture.center = point;
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.theFuture.center = self.center;
            self.theFuture.frame = rect;
        }];
    } else {
        if (CGRectContainsPoint(self.thePast.frame, point)) {
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text = @"Days of Future, Past, Present";
            [self.theFuture sizeToFit];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}



@end
