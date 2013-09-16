//
//  ViewController.m
//  Substring with NSRange
//
//  Created by william pugh on 9/15/13.
//  Copyright (c) 2013 william pugh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark lifecycle methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // we eed to estabish the view controller as the delegate for the UITextfields so we can dismiss the keyboard when editing ends
    _searchString.delegate = self;
    _stringToSearch.delegate = self;
    _startingString.delegate = self;
    _stringLength.delegate = self;
    _endString.delegate = self;
    
    // this just sets a default text to search
    _stringToSearch.text = @"qwerty1234asdf";
    _foundLabel.hidden = YES;
    _foundStringLabel.hidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _foundLabel.hidden = YES;
    _foundStringLabel.hidden = YES;
    _foundStringLabel.text = nil;
    _foundLabel.text = nil;
}


#pragma mark action methods
- (IBAction)findStringButtonTapped:(id)sender
{
    // makes sure both string-to-be-searched and search-string are not empty
    if ([_stringToSearch.text isEqualToString:@""])
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a string to search!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else if ([_searchString.text  isEqualToString:@""] )
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a searchString!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else
    {
        // determines if the search-string is contained in the string-to-be-searched
        NSRange start = [ _stringToSearch.text rangeOfString:_searchString.text];
        NSLog(@"Range is: %@", NSStringFromRange(start));
        if (start.location != NSNotFound)
        {
           // search-string is found starting at start.location
            int stringLength = _searchString.text.length;
            // creates a NSRange with the starting position and length of the search-string
            NSRange searchRange = NSMakeRange(start.location ,stringLength);
            _foundStringLabel.hidden = NO;
            // extracts a substring from the string-to-be-searched at the searchRange
            _foundStringLabel.text = [_stringToSearch.text substringWithRange:searchRange];
            _foundLabel.hidden = NO;
            _foundLabel.text = @"Found it!";
            _foundLabel.backgroundColor = [UIColor greenColor];
            _foundStringLabel.backgroundColor = [UIColor greenColor];        }
        else
        {
           // search-string is not found in the string-to-be-searched
            _foundLabel.hidden = NO;
            _foundLabel.text = @"Did not Find it";
            _foundLabel.backgroundColor = [UIColor redColor];
        }
    }
}


- (IBAction)findSubstringWithLengthButtonTapped:(id)sender
{
    // makes sure string-to-be-searched, search-string, and starting-string are not empty
    if ([_stringToSearch.text isEqualToString:@""])
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a string to search!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else if ([_startingString.text  isEqualToString:@""] )
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a starting string!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else if ([_stringLength.text  isEqualToString:@""] )
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a string length!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else
    {
        // determines if the starting-string is contained in the string-to-be-searched
        NSRange start = [_stringToSearch.text rangeOfString:_startingString.text];
        NSLog(@"Range is: %@", NSStringFromRange(start));
        if (start.location != NSNotFound)
        {
            int stringLengthInt = [_stringLength.text intValue];
            // creates a NSRange with the starting position and length of the search-string
            NSRange searchRange = NSMakeRange(start.location ,stringLengthInt);
            NSLog(@"Range is: %@", NSStringFromRange(searchRange));
            // checks to see that the length of the search-string from the starting positon is not longer that the remaining string-to-be-searched
            if ((_stringToSearch.text.length - searchRange.location) < (stringLengthInt))
            {
                _foundLabel.hidden = NO;
                _foundLabel.text = @"Did not Find it";
                _foundLabel.backgroundColor = [UIColor redColor];
            }
            else
            {
                _foundStringLabel.hidden = NO;
                _foundStringLabel.text = [_stringToSearch.text substringWithRange:searchRange];
                _foundLabel.hidden = NO;
                _foundLabel.text = @"Found it!";
                _foundLabel.backgroundColor = [UIColor greenColor];
                _foundStringLabel.backgroundColor = [UIColor greenColor];
            }
        }
        else
        {
            _foundLabel.hidden = NO;
            _foundLabel.text = @"Did not Find it";
            _foundLabel.backgroundColor = [UIColor redColor];
        }
    }
}


- (IBAction)findSubstringWithBeginAndEndButtonTApped:(id)sender
{
    // makes sure string-to-be-searched, starting-string, and end-string are not empty
    if ([_stringToSearch.text isEqualToString:@""])
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a string to search!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else if ([_startingString.text  isEqualToString:@""] )
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need a starting string!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else if ([_endString.text  isEqualToString:@""] )
    {
        _foundStringLabel.hidden = NO;
        _foundStringLabel.text = @"need an ending string!";
        _foundStringLabel.backgroundColor = [UIColor redColor];
    }
    else
    {
        // determines if the starting-string is contained in the string-to-be-searched
        NSRange start = [_stringToSearch.text rangeOfString:_startingString.text];
        if (start.location != NSNotFound)
        {
            // determines if the ending-string is contained in the string-to-be-searched
            NSRange end = [_stringToSearch.text rangeOfString:_endString.text];
            if (end.location != NSNotFound)
            {
                // checks to see if the ending-string is before the starting-string in the string-to-be-searched
                if (end.location < start.location)
                {
                    _foundLabel.hidden = NO;
                    _foundLabel.text = @"end location before start location";
                    _foundLabel.backgroundColor = [UIColor redColor];
                    
                }
                else
                {
                    /*
                     creates a NSRange with the starting-string location as the location and the ending-string location plus the length of the ending-string minus the starting-string location as the length.
                     This last part is a little complicated so lets explore it.
                     Say the starting-string location is 10 and the ending-string location is 20 and the length of the ending-string is 5.
                     our NSRange searchRange has a location of 1 (easy part) 
                     and a length of 20 + 5 which gets us to the end position of the ending-string.  
                     We can's stop here because w eneed to subtract out the starting position of the string which is the starting-string location.
                     */
                    NSRange searchRange = NSMakeRange(start.location ,(end.location + _endString.text.length) - start.location);
                    _foundStringLabel.hidden = NO;
                    _foundStringLabel.text = [_stringToSearch.text substringWithRange:searchRange];
                    _foundLabel.hidden = NO;
                    _foundLabel.text = @"Found it!";
                    _foundLabel.backgroundColor = [UIColor greenColor];
                    _foundStringLabel.backgroundColor = [UIColor greenColor];
                }
            }
            else
            {
                _foundLabel.hidden = NO;
                _foundLabel.text = @"Did not Find end string";
                _foundLabel.backgroundColor = [UIColor redColor];
            }
        }
        else
        {
            _foundLabel.hidden = NO;
            _foundLabel.text = @"Did not Find start string";
            _foundLabel.backgroundColor = [UIColor redColor];
        }
    }
}
@end
