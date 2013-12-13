//
//  NewBookViewController.m
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "NewBookViewController.h"

@interface NewBookViewController ()

@end

@implementation NewBookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.titleField.delegate     = self;
    self.authorField.delegate    = self;
    self.categoryPicker.delegate = self;
    
    // The currentPickerIndex will be set to 0 by default.
    // This way, if the user does not move the category picker, the first object will still be selected.
    //      The currentPickerIndex will be used to determine what shelf the new book should be placed on.
    currentPickerIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Text field delegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Check to see if the warning label should be hidden when a user updates the textfields.
    
    if (self.titleField.text.length != 0 && self.authorField.text.length != 0) {
        self.warningLabel.alpha = 0;
    }
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    // Check to see if the warning label should be hidden when the user finishes editing the textields.
    
    if (self.titleField.text.length != 0 && self.authorField.text.length != 0) {
        self.warningLabel.alpha = 0;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Dismiss the keyboard when the user taps the return key.
    
    [self.view endEditing:YES];
    
    return YES;
}

#pragma mark - UI Picker Delegate Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Return the number of components (columns) the category picker (UIPicker) should contain.
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // Return the number of rows in the category picker.
    
    return self.categories.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Return the title for the rows in the category picker.
    
    NSString *pickerTitle = [self.categories objectAtIndex:row];
    
    return pickerTitle;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Update the currentPicker row index when the user selects a row.
    // The currentPickerIndex will be used to determine what shelf to put the
    //      book on when the user taps the save button.
    
    currentPickerIndex = row;
    
    [self.view endEditing:YES];
}

- (IBAction)closeView:(id)sender
{
    // Dismiss the current view controller.
    // Linked to the "cancel" button.
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveNewBook:(id)sender
{
    // Create a new book and send it to the delegate so it can place it in the shelves table view.
    
    if (self.titleField.text.length != 0 && self.authorField.text.length != 0) {
        if ([self.delegate respondsToSelector:@selector(addNewBook:)]) {
            NSString *category = [self.categories objectAtIndex:currentPickerIndex];
            
            Book *newBook = [[Book alloc] initWithTitle:self.titleField.text author:self.authorField.text category:category];
            
            [self.delegate addNewBook:newBook];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } else {
        self.warningLabel.alpha = 1;
        return;
    }
}


@end










