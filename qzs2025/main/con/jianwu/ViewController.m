//
//  ViewController.m
//  qzs2025
//
//  Created by qiuzishuo on 2025/7/25.
//

#import "ViewController.h"
#import "SubVC.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor yellowColor];
    
//    [self test2];
//    extern NSString * const subName;
//    NSLog(@"234");
//    NSLog(@"%@",subName);
//    NSLog(@"%@",);
    
    
}

-(void)test1
{
    
    dispatch_sync(dispatch_get_main_queue(), ^{
                [NSThread sleepForTimeInterval:1.0f];
                NSLog(@"thread:%@", [NSThread currentThread]);
            });
    NSLog(@"haha");//造成死锁，haha永远不会打印

  
}

-(void)test22
{
    dispatch_queue_t serialQueue = dispatch_get_global_queue(0, 0);
    
    dispatch_sync(serialQueue, ^{
                NSLog(@"thread1:%@", [NSThread currentThread]);
                dispatch_sync(serialQueue, ^{
                    NSLog(@"thread2:%@", [NSThread currentThread]);//造成死锁，thread2永远不会打印
                });
            });
    
}

-(void)test2
{
    dispatch_queue_t serialQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(serialQueue, ^{
                NSLog(@"thread1:%@", [NSThread currentThread]);
                dispatch_sync(serialQueue, ^{
                    NSLog(@"thread2:%@", [NSThread currentThread]);//造成死锁，thread2永远不会打印
                });
            });
  

  
}


@end
