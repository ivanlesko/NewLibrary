//
//  LibraryViewController.h
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Library.h"
#import "ShelvesViewController.h"

@interface LibraryViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSMutableArray *libraries;
}

-(void)populateLibraries;

@end
