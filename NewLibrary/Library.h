//
//  Library.h
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shelf.h"

@interface Library : NSObject

@property (nonatomic, strong) NSNumber *numberOfShelves;
@property (nonatomic, strong) NSMutableArray *shelves;
@property (nonatomic, strong) NSString *name;

- (void)addShelf:(Shelf *)theShelf;
- (void)displayAllBooksInLibrary;

- (id)initWithName:(NSString *)theName;

@end
