//
//  ZYNavigationView.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/30.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYNavigationView.h"
@interface ZYNavigationView()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation ZYNavigationView
+(instancetype)showNavigationView{
    ZYNavigationView *mNavigationView = [[[NSBundle mainBundle]loadNibNamed:@"ZYNavigationView" owner:self options:nil]firstObject];
    mNavigationView.searchTextField.delegate = mNavigationView;
    [mNavigationView setFrame:CGRectMake(0,20, SCREEN_WIDTH, 44)];

return mNavigationView;

}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)userAction:(UIButton *)sender {
    [NSNOTIFICATION postNotificationName:@"ZY_UserView" object:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
