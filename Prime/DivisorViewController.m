//
//  DivisorViewController.m
//  Prime
//
//  Created by MAEDA HAJIME on 2014/03/06.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "DivisorViewController.h"

@interface DivisorViewController ()

@end

@implementation DivisorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 初期処理
    self.tvdisply.text = @"";
    
    // 編集は不可 ストリートボード Behavion「editable」のチェックを外す
    self.tvdisply.editable = NO;
    
    // 約数の表示処理
    [self doDivisor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 約数の表示処理
- (void)doDivisor
{
    //int x = 0;
    
    // (初期値;)
    // ループ1
    for (int i = 1; i <= 100; i++) {
        //NSLog(@"iの数値:%d",i);
        
        int l = 0;
        
        // ループ2
        for (int j = 1; j <= 10; j++) {
            
            //NSLog(@"jの値：%d*%d = %d",i,j,x);
            
            //
            double k = i % j;
            // 小数点以下2桁までのみをresultLabelに表示
            //[kk setText:[NSString stringWithFormat: @"%.2f", k]];
            
            // k = 0 割れたらならば lに1をプラス
            if (k == 0) {
                l++;
            }
        }
        // AppendingFormat文字の追加
        self.tvdisply.text =
        [self.tvdisply.text stringByAppendingFormat:@"%d 約数の個数:%d \n", i, l];
    }
}


@end
