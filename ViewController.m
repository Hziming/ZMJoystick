//
//  ViewController.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/23.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "ViewController.h"
#import "ZMJoystick.h"
#import "DoubleJoysticks.h"
#import "StartTopItem.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UILabel *leftLab;

@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray arrayWithArray:[StartTopModel getData]];
    
    DoubleJoysticks *joystick = [DoubleJoysticks joystickWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];

    [self.view addSubview:joystick];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
//    return 9;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StartTopItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    StartTopModel *model = self.dataSource[indexPath.row];
    [item.image setImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
    
    return item;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = (self.view.frame.size.width - 14) / self.dataSource.count;
    
    return CGSizeMake(w, 50);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


//    __weak ViewController *weakself = self;
//
//    ZMJoystick *joystick = [ZMJoystick joystickWithFrame:CGRectMake(50, 50, 250, 250)];
//
//    [joystick setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
//
//        weakself.leftLab.text = [NSString stringWithFormat:@"%0.2lX, %0.2lX", (unsigned long)vertical, (unsigned long)horizontal];
//    }];
//
//    [self.view addSubview:joystick];
//
//
//    ZMJoystick *joystick2 = [ZMJoystick joystickWithFrame:CGRectMake(350, 50, 250, 250)];
//
//    [joystick2 setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
//
//        weakself.rightLab.text = [NSString stringWithFormat:@"%0.2lX, %0.2lX", (unsigned long)vertical, (unsigned long)horizontal];
//    }];
//
//    [self.view addSubview:joystick2];
