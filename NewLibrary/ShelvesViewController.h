//
//  ShelvesViewController.h
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Library.h"
#import "Book.h"
#import "BookPageViewController.h"
#import "NewBookViewController.h"

@interface ShelvesViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, NewBookDelegate>

@property Library *library;
@property NSMutableArray *shelves;

@end
