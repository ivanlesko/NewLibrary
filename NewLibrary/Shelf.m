//
//  Shelf.m
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "Shelf.h"

@implementation Shelf

- (id)init
{
    self = [super init];
    if (self) {
        // Give the shelf default values if the user does not use the designated initializer
        self.name = @"Missing Shelf Name";
        self.books = [NSMutableArray array];
    }
    
    return self;
}

// This is the default initializer
- (id)initWithShelfName:(NSString *)theName
{
    self = [super init];
    if (self) {
        self.name = theName;
        self.books = [NSMutableArray array];
    }
    
    return self;
}

- (void)displayAllBooks
{
    int counter = 1;
    
    // If the shelf does not contain any books, simply display the shelf's name.
    if (self.books.count == 0) {
        NSLog(@"The %@ shelf if empty.", self.name);
        NSLog(@" ");
    } else {
        // Otherwise, if the shelf contains one or more books, print all of their descriptions.
        NSLog(@"%@ shelf contains:", self.name);
        NSLog(@"---------------------------------------------------------------");
        for (Book *theBook in self.books) {
            NSLog(@"%d. %@", counter, theBook.bookDescription);
            counter++;
        }
        NSLog(@"---------------------------------------------------------------");
        NSLog(@" ");
    }
}

- (NSString *)description
{
    // Returns a better description for the shelf.  
    
    NSString *descriptionString = [NSString stringWithFormat:@"%@ shelf: %d books.", self.name, self.books.count];
    return descriptionString;
}

@end











