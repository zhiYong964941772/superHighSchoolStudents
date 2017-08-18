//
//  ZYSignViewController.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/8/1.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYSignViewController.h"
#import "ZYLoginServer.h"
#import "ZYJiangLiViewController.h"
@interface ZYSignViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *againPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *tuijianTF;
@property (weak, nonatomic) IBOutlet UITextField *tuijianPhoneTF;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *schoolTF;
@property (copy, nonatomic) NSString *userPhone;
@property (copy, nonatomic) NSString *phoneCode;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *schoolName;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *againPassword;
@property (copy, nonatomic) NSString *tuijianName;
@property (copy, nonatomic) NSString *tuijianPhone;
@property (assign, nonatomic) NSInteger codeTime;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ZYSignViewController
- (IBAction)schoolTF:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册账号";
    self.phoneTF.delegate = self;
    self.nameTF.delegate = self;
    self.codeTF.delegate = self;
    self.passwordTF.delegate = self;
    self.tuijianPhoneTF.delegate = self;
    self.tuijianTF.delegate = self;
    self.againPasswordTF.delegate = self;
    self.schoolTF.delegate = self;
    self.phoneCode = @"";
    self.againPassword = @"";
    self.tuijianPhone = @"";
    self.userPhone = @"";
    self.userName = @"";
    self.schoolName = @"";
    self.password = @"";
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
            self.userPhone = textField.text;
        }
            break;
        case 1:
        {
            if (textField.text.length!=4) {
                [MBProgressHUD showError:@"验证码格式不正确"];
                return;
            }
            self.phoneCode = textField.text;
        }
            break;
        case 2:
        {
            
            if (textField.text.length<1) {
                [MBProgressHUD showError:@"姓名不能为空"];
                return;
            }
            self.userName = textField.text;
            
        }
            break;
        case 3:
        {
            if (textField.text.length<1) {
                [MBProgressHUD showError:@"学校不能为空"];
                return;
            }
            self.schoolName = textField.text;
        }
            break;
        case 4:
        {
            BOOL isPassword = [NSString isPassword:textField.text];
            if (!isPassword) {
                [MBProgressHUD showError:@"密码由6-20位数字、字母组合"];
                return;
            }
            self.password = textField.text;

            if (![self.password isEqualToString:textField.text]&&self.againPassword.length>0) {
                [MBProgressHUD showError:@"两次输入的密码不一致"];
                return;
            }

        }
            break;
        case 5:
        {
            BOOL isPassword = [NSString isPassword:textField.text];
            if (!isPassword) {
                [MBProgressHUD showError:@"密码由6-20位数字、字母组合"];
                return;
            }
            if (![self.password isEqualToString:textField.text]&&self.password.length>0) {
                [MBProgressHUD showError:@"两次输入的密码不一致"];
                return;
            }
            self.againPassword = textField.text;
        }
            break;
        case 6:
        {
            
            if (textField.text.length<1) {
                [MBProgressHUD showError:@"姓名不能为空"];
                return;
            }
            self.tuijianName = textField.text;

        }
            break;
        case 7:
        {
            BOOL isPhone = [NSString isPhoneNumber:textField.text];
            if (!isPhone) {
                [MBProgressHUD showError:@"请输入正确的手机号码"];
                return;
            }
            self.tuijianPhone = textField.text;
        }
            break;
   
        default:
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
- (IBAction)recommendedAction:(UIButton *)sender {
   BOOL isBgV = sender.selected = !sender.selected;
    [self.bgView setAlpha:(isBgV)?0.0:1.0];
}
- (IBAction)jiangliAction:(id)sender {
    ZYJiangLiViewController *jiangli = [[ZYJiangLiViewController alloc]initWithNibName:@"ZYJiangLiViewController" bundle:nil];
    [self.navigationController pushViewController:jiangli animated:YES];
}
- (IBAction)getPhoneCode:(id)sender {
//    if (!self.phoneCode) {
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
- (IBAction)signBtn:(id)sender {
    
    if (self.phoneCode.length<1||[self.phoneCode isEqualToString:@""]) {
        [MBProgressHUD showError:@"验证码格式不正确"];
        return;
    }
    if (self.againPassword.length<1||[self.againPassword isEqualToString:@""]) {
        [MBProgressHUD showError:@"两次密码不对应"];
        return;
    }
    if (self.password.length<1||[self.password isEqualToString:@""]) {
        [MBProgressHUD showError:@"两次密码不对应"];
        return;
    }
    if (self.userPhone.length<1||[self.userPhone isEqualToString:@""]) {
        [MBProgressHUD showError:@"电话号码不能为空"];
        return;
    }
    if (self.userName.length<1||[self.userName isEqualToString:@""]) {
        [MBProgressHUD showError:@"用户名不能为空"];
        return;
    }
    if (self.schoolName.length<1||[self.schoolName isEqualToString:@""]) {
        [MBProgressHUD showError:@"学校名不能为空"];
        return;
    }
  
   

    NSDictionary *dic = @{@"code":self.phoneCode,
                          @"repassword":self.againPassword,
                          @"phone":self.userPhone,
                          @"name":self.userName,
                          @"school":self.schoolName,
                          @"password":self.password};
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]initWithDictionary:dic];
    if (self.tuijianPhone.length>0&&self.tuijianName>0) {
        [mutableDic setObject:self.tuijianPhone forKey:@"referee_id"];
    }
    [ZYLoginServer signWithUserData:mutableDic WithSuccess:^(id obj) {
        if (obj) {
            [MBProgressHUD showSuccess:obj];
            [NSUSERDEFAULTS setObject:self.userPhone forKey:@"USERPHONE"];
            [NSUSERDEFAULTS setObject:self.password forKey:@"PASSWORD"];
            [self endTimer];

        }
    } WithFailt:^(id obj) {
        
    }];
}
- (void)endTimer
{
    if(_timer != nil)
    {
        if([_timer isValid])
            [_timer invalidate];
        _timer = nil;
    }
    [self.navigationController popViewControllerAnimated:YES];
    [self.view endEditing:YES];
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
