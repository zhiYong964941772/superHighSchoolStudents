//
//  ZYForgetViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/31.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYForgetViewController.h"
#import "ZYForgetNextViewController.h"
#import "ZYLoginServer.h"
@interface ZYForgetViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userPhone;
@property (weak, nonatomic) IBOutlet UITextField *phoneCode;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (assign, nonatomic) NSInteger codeTime;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ZYForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    self.userPhone.delegate = self;
    self.phoneCode.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)smsAction:(UIButton *)sender {
    
    //    if (!self.phoneCode.text) {
    //        [MBProgressHUD showError:@"验证码不能为空"];
    //        return;
    //    }
    //    [ZYLoginServer getPhoneCodeWithPhone:self.userPhone WithSuccess:^(id obj) {
    //
    //    } WithFailt:^(id obj) {
    //
    //    }];
    self.codeBtn.userInteractionEnabled = NO;
    _codeTime = 59;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeHander:) userInfo:nil repeats:YES];
}
- (void)timeHander:(NSTimer *)timer
{
    _codeTime--;
    if(_codeTime <= 0)
    {
        [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        //        [self.codeBtn setTitleColor:KGREENCOLOR forState:UIControlStateNormal];
        [self endTimer];
        
    }
    else
    {
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%ld  秒",_codeTime] forState:UIControlStateNormal];
        //        [self.authCodeView.sendAuthCodeBtn setTitleColor:KGREENCOLOR forState:UIControlStateNormal];
    }
}
- (IBAction)nextAction:(UIButton *)sender {
    if (self.phoneCode.text.length<1||[self.phoneCode.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"验证码格式不正确"];
        return;
    }
    if (self.userPhone.text.length<1||[self.userPhone.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"电话号码不能为空"];
        return;
    }

    
    [ZYLoginServer validationWithPhoneCode:@{@"phone":self.userPhone.text,@"code":self.phoneCode.text} WithSuccess:^(id obj) {
        [MBProgressHUD showError:obj];
        if ([obj isEqualToString:@"操作成功"]) {
            ZYForgetNextViewController *nextVc = [[ZYForgetNextViewController alloc]initWithNibName:@"ZYForgetNextViewController" bundle:nil];
            nextVc.code = self.phoneCode.text;
            [self.navigationController pushViewController:nextVc animated:YES];
        }
    } WithFailt:^(id obj) {
        
    }];
    [self.view endEditing:YES];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)endTimer
{
    if(_timer != nil)
    {
        if([_timer isValid])
            [_timer invalidate];
        _timer = nil;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
