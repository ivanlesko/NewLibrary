//
//  NewBookViewController.h
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@protocol NewBookDelegate <NSObject>

- (void)addNewBook:(Book *)theBook;

@end

@interface NewBookViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSInteger currentPickerIndex;
}

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;

- (IBAction)closeView:(id)sender;
- (IBAction)saveNewBook:(id)sender;

@property (nonatomic, assign) id delegate;
@property NSUInteger *bookIndexNumber;
@property NSArray *categories;

@end
