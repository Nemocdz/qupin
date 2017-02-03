//
//  testViewController.m
//  
//
//  Created by Nemocdz on 2017/1/21.
//
//

#import "testViewController.h"
#import "AFNetworking.h"
#import "QPUserItem.h"
#import "AppDelegate.h"


@interface testViewController ()
- (IBAction)test:(id)sender;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)open:(UIButton *)sender {
     [AppDelegate openLoginWindow];
}


- (IBAction)test:(id)sender {
    NSLog(@"%@",[QPUserItem currentUser]);
    NSLog(@"%@",[QPUserItem new]);
     
    
}
@end
