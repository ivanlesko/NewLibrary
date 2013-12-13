//
//  BookPageViewController.m
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "BookPageViewController.h"

@interface BookPageViewController ()

@end

@implementation BookPageViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Give the view controller's labels values that correspond with the book it's displaying.
    
    self.titleLabel.text = self.selectedBook.title;
    self.authorLabel.text = self.selectedBook.author;
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@ by %@ is available on the %@ shelf.", self.selectedBook.title,
                                  self.selectedBook.author,
                                  self.selectedBook.category];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    // Dismiss the view controller.
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)removeBook:(id)sender
{
    // Remove the book from the shelves table view and dismiss the view controller.
    
    [self.selectedBook unshelf];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
