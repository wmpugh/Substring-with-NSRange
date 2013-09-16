//
//  ViewController.h
//  Substring with NSRange
//
//  Created by william pugh on 9/15/13.
//  Copyright (c) 2013 william pugh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchString;
@property (weak, nonatomic) IBOutlet UITextField *stringToSearch;
@property (weak, nonatomic) IBOutlet UILabel *foundLabel;
@property (weak, nonatomic) IBOutlet UILabel *foundStringLabel;
- (IBAction)findStringButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *startingString;
@property (weak, nonatomic) IBOutlet UITextField *stringLength;
- (IBAction)findSubstringWithLengthButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *endString;
- (IBAction)findSubstringWithBeginAndEndButtonTApped:(id)sender;

@end
