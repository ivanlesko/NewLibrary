//
//  Library.m
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "Library.h"

@implementation Library

- (id)init
{
    // Returns a library with a default library name in case the user does not use the designated intializer
    
    return [self initWithName:@"Missing Library Name"];
}

- (void)addShelf:(Shelf *)theShelf
{
    // Add a shelf to the library
    
    [[self shelves] addObject:theShelf];
    self.numberOfShelves = [NSNumber numberWithInt:self.shelves.count];
}

- (void)displayAllBooksInLibrary
{
    // Logs a list of all the books in the Library
    
    for (Shelf *theShelf in self.shelves) {
        [theShelf displayAllBooks];
    }
}

- (id)initWithName:(NSString *)theName
{
    // This is the default intializer
    
    self = [super init];
    if (self) {
        self.shelves = [NSMutableArray array];
        self.numberOfShelves = [NSNumber numberWithInt:self.shelves.count];
        self.name = theName;
    }
    
    return self;
}

@end

