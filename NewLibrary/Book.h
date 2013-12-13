//
//  Book.h
//  20131209_LibaryModelObjects
//
//  Created by Ivan on 12/9/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shelf.h"

@class Shelf;

@interface Book : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) Shelf *shelf;

@property (nonatomic, strong) NSString *bookDescription;

- (id)initWithTitle:(NSString *)theTitle author:(NSString *)theAuthor category:(NSString *)theCategory;

- (void)addToShelf:(Shelf *)theShelf;
- (void)unshelf;


@end
