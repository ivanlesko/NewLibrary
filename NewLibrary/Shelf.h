//
//  Shelf.h
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Shelf : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *books;

- (id)initWithShelfName:(NSString *)theName;
- (void)displayAllBooks;

@end
