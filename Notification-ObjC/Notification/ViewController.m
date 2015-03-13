//
//  ViewController.m
//  Notification
//
//  Created by David Yang on 15/2/28.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *configLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 54, width, 44)];
    configLabel.textAlignment = NSTextAlignmentCenter;
    configLabel.text = @"ConfigSetting";
    [self.view addSubview:configLabel];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((width-300)/2.0, 20, 300, 300)];
    _imageView.center = CGPointMake(width/2.0, height/2.0 -64);
    [_imageView setImage:[UIImage imageNamed:@"notification"]];
    [self.view addSubview:_imageView];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    saveButton.frame = CGRectMake(0, _imageView.frame.origin.y + _imageView.bounds.size.height, 80, 44);
    saveButton.center = CGPointMake(_imageView.center.x, saveButton.center.y);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(tapSaveImageToIphone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tapSaveImageToIphone{
    
    /**
     *  将图片保存到iPhone本地相册
     *  UIImage *image            图片对象
     *  id completionTarget       响应方法对象
     *  SEL completionSelector    方法
     *  void *contextInfo
     */
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:@"Has been saved to the album" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:@"Failure" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}
@end
