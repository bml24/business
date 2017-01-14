//
//  ViewController.h
//  business
//
//  Created by yuechuang on 2017/1/11.
//  Copyright © 2017年 yuechuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

typedef void (^Blo)(NSString* str,UIColor * color);

@property (nonatomic,strong)Blo block;



@end

