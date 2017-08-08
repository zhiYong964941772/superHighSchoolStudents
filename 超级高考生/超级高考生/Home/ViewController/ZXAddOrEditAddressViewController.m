//
//  ZXAddOrEditAddressViewController.m
//  书城
//
//  Created by 好采猫 on 2017/8/5.
//  Copyright © 2017年 李三年. All rights reserved.
//

#import "ZXAddOrEditAddressViewController.h"
#import "BLAreaPickerView.h"

@interface ZXAddOrEditAddressViewController ()<BLPickerViewDelegate>
@property (nonatomic, strong) BLAreaPickerView *pickView;
@property (weak, nonatomic) IBOutlet UITextField *provinceTextField;


@end

@implementation ZXAddOrEditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑收货地址";
}
- (IBAction)chooseAreaClick:(UIButton *)sender {
    _pickView = [[BLAreaPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    _pickView.pickViewDelegate = self;
    [_pickView bl_show];
}

#pragma mark - - BLPickerViewDelegate
- (void)bl_selectedAreaResultWithProvince:(NSString *)provinceTitle city:(NSString *)cityTitle area:(NSString *)areaTitle{
    NSLog(@"%@,%@,%@",provinceTitle,cityTitle,areaTitle);
    _provinceTextField.text = [NSString stringWithFormat:@"%@ %@ %@",provinceTitle,cityTitle,areaTitle];

}

- (IBAction)deleteAddressClick:(UIButton *)sender {
    
    NSLog(@"删除地址");
    
}
- (IBAction)setDefaultAddressClick:(UIButton *)sender {
    NSLog(@"设为默认地址");
    sender.selected = !sender.selected;
}


@end
