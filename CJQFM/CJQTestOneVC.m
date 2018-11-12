//
//  CJQTestOneVC.m
//  CJQFM
//
//  Created by cjq on 2018/11/2.
//  Copyright © 2018 cjq. All rights reserved.
//

#import "CJQTestOneVC.h"
#import "CJQTestTwoVC.h"
#import "CJQMediatorManger.h"
@interface CJQTestOneVC ()

@end

@implementation CJQTestOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 666;
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"哈哈蛤");
    
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter ] postNotificationName:@"playState" object:@(isPlay)];
    
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
     
     
    [self.navigationController pushViewController:[CJQTestTwoVC new] animated:YES];
    
    //CJQMediatorManger performTarget:<#(nonnull NSString *)#> action:<#(nonnull NSString *)#> params:<#(nonnull id)#> isRequiredReturnValue:<#(BOOL)#>
}


@end
