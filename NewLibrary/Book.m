//
//  Book.m
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "Book.h"


@implementation Book

- (id)init
{
    self = [super init];
    if (self) {
        // Overriding default values from "Null" to something more appealing if the user does not specify book properties.
        self = [self initWithTitle:@"Missing Title"
                            author:@"Missing Author"
                          category:@"Missing Category"];
    }
    
    return self;
}

// This is the default initializer
- (id)initWithTitle:(NSString *)theTitle author:(NSString *)theAuthor category:(NSString *)theCategory;
{
    self = [super init];
    if (self) {
        // By Default, books will be placed on a shelf based on their category.
        self.title = theTitle;
        self.author = theAuthor;
        self.category = theCategory;
    }
    
    return self;
}

- (void)addToShelf:(Shelf *)theShelf
{
    // Remove the book from the current shelf before adding it to a new one.
    
    Shelf *currentShelf = self.shelf;
    [[currentShelf books] removeObject:self];
    
    // Add the book to the new shelf.
    
    self.shelf = theShelf;
    [[theShelf books] addObject:self];
    
    self.bookDescription = [NSString stringWithFormat:@"%@ by %@ is on the %@ shelf", self.title, self.author, self.shelf.name];
}

- (void)unshelf
{
    // Remove the book from its current shelf.
    
    Shelf *currentShelf = self.shelf;
    [[currentShelf books] removeObject:self];
    
    self.bookDescription = [NSString stringWithFormat:@"%@ by %@ is on the %@ shelf", self.title, self.author, self.shelf.name];
}

- (NSString *)description
{
    // Returns a better description of the book containing the title, author, and category.
    
    NSString *descriptionText = [NSString stringWithFormat:@"%@ by %@. Category: %@", self.title, self.author, self.category];
    return descriptionText;
}

@end








