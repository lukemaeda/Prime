//
//  ViewController.m
//  Kuku
//
//  Created by kunren10 on 2014/02/28.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 初期処理
    self.tvdisply.text = @"";
    
    // 編集は不可 ストリートボード Behavion「editable」のチェックを外す
    self.tvdisply.editable = NO;
    
    // 約数の表示処理
    //[self doDivisor];
    
    // 素数表示処理
    [self doPrime];

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

// 素数表示処理
- (void)doPrime
{
    //int x = 0;
    
    // (初期値;)
    // ループ1
    for (int i = 1; i <= 100; i++) {
        //NSLog(@"iの数値:%d",i);
        
        int l = 0;
        
        // ループ2
        for (int j = 1; j <= 10; j++) {
            
            double k = i % j;
            
            // k = 0 割れたらならば lに1をプラス
            if (k == 0) {
                l++;
            }
        }
        // AppendingFormat文字の追加 この記述の中で　i * j　掛け算して表示している
        if (i <= 10) {
            if (l == 1 || l == 2) {
                self.tvdisply.text =
                [self.tvdisply.text stringByAppendingFormat:@"%d 素数:%d \n", i, l];
            }
        } else {
            if (l == 1) {
                self.tvdisply.text =
                [self.tvdisply.text stringByAppendingFormat:@"%d 素数:%d \n", i, l];
            }
        }
    }
}

@end

/*
 「int型の変数xが2の倍数」であるという事象は、「xは2で割り切れる」、すなわち「xを2で割った時のあまりは0」であるという事象と同値です。そこで、以下のif文を用いることで、「変数xが2の倍数」であるか確認できます。
 
 このように、割り算における「あまり」を有効に活用することで、場合分けが行えるケースがあります。このようなテクニックはプログラミングを行う上でよく活用するので、ぜひ覚えてください。
 
 if (x % 2 == 0) {
 【xは2の倍数である】
 }
 
 小数の文字列への変換
 int型の変数をNSString型の文字列に変換した上で、ラベルに適用しました。ドル円換算機でも、計算結果をUI画面上のラベルに反映させる場合、double型の変数をNSString型の文字列に変換する必要があります。そのコード例を以下に示します。
 
 // 円→ドル変換の場合
 [NSString stringWithFormat: @"%.2f", result];
 
 基本的には、int型の変数を文字列に変換する場合と大差ありません。唯一違う場所はフォーマット指定子です。第2講でも述べた通り、小数を用いる場合は「%f」というフォーマット指定子を使います。しかし、このフォーマット指定子には留意点があります。
 
 特に断りが無い限り、「%f」単体では小数点以下6桁までを表示してしまいます。従って、上の例で「result = 12.2」であると仮定した場合、この文字列は、「12.200000」として扱われます。
 
 これでは、金額を換算したときに、あまりにわかりづらい計算結果が表示されてしまいます。計算結果における小数点以下の数字に関しては、ドルと円の特性を踏まえ以下のようになっていることが望ましいと言えます。
 ドル…小数点以下2桁
 円…小数点以下0桁（整数部のみを表示）
 そこで、役に立つのが、フォーマット指定子における表示桁数の指定です。上記例を見ると、フォーマット指定子が「%.2f」となっています。これは、「小数点以下2桁までを表示」ということを明示しています。同様に「%.4f」となっている場合は小数点以下4桁までが表示され、「%.0f」となっている場合は整数部のみが表示されます。
 
 この機能を用いることで、「円からドルに変換」する場合と「ドルから円に変換」する場合で、表示形式を切り分けことが可能となります。その例を、以下に示します。
 
 // 円→ドル変換の場合（小数点以下2桁まで表示）
 [resultLabel setText:[NSString  stringWithFormat: @"%.2f", result]];
 // ドル→円変換の場合（整数部のみ表示）
 [resultLabel setText:[NSString stringWithFormat: @"%.0f", result]];
 
 http://ios.rainbowapps.jp/text_dev/03
 */

