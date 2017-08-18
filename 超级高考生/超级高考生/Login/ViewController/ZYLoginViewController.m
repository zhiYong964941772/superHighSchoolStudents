//
//  ZYLoginViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYLoginViewController.h"
#import "ZYTabBarViewController.h"
#import "ZYForgetViewController.h"
#import "ZYSignViewController.h"
#import "ZYLoginServer.h"
@interface ZYLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userPhone;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (copy, nonatomic) NSString *phoneStr;
@property (copy, nonatomic) NSString *passwordStr;

@end

@implementation ZYLoginViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.phoneStr = [NSUSERDEFAULTS objectForKey:@"USERPHONE"];
    self.passwordStr = [NSUSERDEFAULTS objectForKey:@"PASSWORD"];
    if (self.phoneStr.length>0 && self.passwordStr.length>0) {
        self.userPhone.text = self.phoneStr;
        self.password.text = self.passwordStr;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.userPhone.delegate = self;
    self.password.delegate = self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger tag = textField.tag;
    switch (tag) {
        case 0:
        {
            BOOL isPhone = [NSString isPhoneNumber:textField.text];
            if (!isPhone) {
                [MBProgressHUD showError:@"请输入正确的手机号码"];
                return;
            }
            self.phoneStr = textField.text;
        }
        case 1:
        {
            BOOL isPassword = [NSString isPassword:textField.text];
            if (!isPassword) {
                [MBProgressHUD showError:@"密码由6-20位数字、字母组合"];
                return;
            }
            self.passwordStr = textField.text;
            
        }
  
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)qqAction:(UIButton *)sender {
}
- (IBAction)weiBoAction:(UIButton *)sender {
}
- (IBAction)weixinAction:(UIButton *)sender {
}
- (IBAction)regisAction:(UIButton *)sender {
    ZYSignViewController *signVc = [[ZYSignViewController alloc]initWithNibName:@"ZYSignViewController" bundle:nil];
    [self.navigationController pushViewController:signVc animated:YES];
}
- (IBAction)forgetAction:(UIButton *)sender {
    ZYForgetViewController *forgetVc = [[ZYForgetViewController alloc]initWithNibName:@"ZYForgetViewController" bundle:nil];
    [self.navigationController pushViewController:forgetVc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginAction:(UIButton *)sender {
    
    if (self.phoneStr.length<1||[self.phoneStr isEqualToString:@""]) {
        [MBProgressHUD showError:@"电话号码不能为空"];
        return;
    }
    if (self.passwordStr.length<1||[self.passwordStr isEqualToString:@""]) {
        [MBProgressHUD showError:@"登陆密码不能为空"];
        return;
    }

    [NSUSERDEFAULTS setObject:self.phoneStr forKey:@"USERPHONE"];
    [NSUSERDEFAULTS setObject:self.passwordStr forKey:@"PASSWORD"];

    [ZYLoginServer loginWithUserData:@{@"phone":self.phoneStr,@"password":self.passwordStr} WithSuccess:^(id obj) {
        NSString *str = obj;
        [MBProgressHUD showError:str];
        if ([str isEqualToString:@"登陆成功"]) {
            [ZYLoginServer getUserIDWithDic:@{@"phone":self.phoneStr,@"name":USERNAME} Success:^(id obj) {
                NSInteger i = [obj integerValue];
                if (i == 1) {
                    ZYTabBarViewController *tabVC = [[ZYTabBarViewController alloc]init];
                    [self presentViewController:tabVC animated:YES completion:nil];
                }else{
                    [MBProgressHUD showError:@"该用户不存在"];
                }
               
            } WithFailt:^(id obj) {
                
            }];
           
        }
    } WithFailt:^(id obj) {
        
    }];
    [self.view endEditing:YES];

}

@end
