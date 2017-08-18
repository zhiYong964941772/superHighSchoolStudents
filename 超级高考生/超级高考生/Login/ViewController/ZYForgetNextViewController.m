//
//  ZYForgetNextViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/31.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYForgetNextViewController.h"
#import "ZYLoginServer.h"
@interface ZYForgetNextViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation ZYForgetNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置新密码";
    self.oldPasswordTF.delegate = self;
    self.passwordTF.delegate = self;
}
- (IBAction)changePassword:(id)sender {
    if (self.oldPasswordTF.text.length<1||[self.oldPasswordTF.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"两次密码不对应"];
        return;
    }
    if (self.passwordTF.text.length<1||[self.passwordTF.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"两次密码不对应"];
        return;
    }
    [ZYLoginServer changePasswordWithPassword:@{@"phone":[NSUSERDEFAULTS objectForKey:@"USERPHONE"],
                                                @"code":self.code,
                                                @"password":self.passwordTF.text} WithSuccess:^(id obj) {
                                                    if ([obj isEqualToString:@"操作成功"]) {
                                                        [NSUSERDEFAULTS setObject:self.passwordTF.text forKey:@"PASSWORD"];
                                                        [self.navigationController popToRootViewControllerAnimated:YES];
                                                    }
    } WithFailt:^(id obj) {
        
    }];
    [self.view endEditing:YES];

}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger tag = textField.tag;
    switch (tag) {
            case 0:
        {
            BOOL isPassword = [NSString isPassword:textField.text];
            if (!isPassword) {
                [MBProgressHUD showError:@"密码由6-20位数字、字母组合"];
                return;
            }
            if (![self.passwordTF.text isEqualToString:textField.text]&&textField.text.length>0) {
                [MBProgressHUD showError:@"两次输入的密码不一致"];
                return;
            }
            
        }
            break;
        case 1:
        {
            BOOL isPassword = [NSString isPassword:textField.text];
            if (!isPassword) {
                [MBProgressHUD showError:@"密码由6-20位数字、字母组合"];
                return;
            }
            if (![self.oldPasswordTF.text isEqualToString:textField.text]&&self.oldPasswordTF.text.length>0) {
                [MBProgressHUD showError:@"两次输入的密码不一致"];
                return;
            }
        }
            break;
      
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
