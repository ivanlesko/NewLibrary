//
//  ShelvesViewController.m
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "ShelvesViewController.h"

@interface ShelvesViewController ()

@end

@implementation ShelvesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Add the plus button to the top right of the navigation controller.
        UIBarButtonItem *addNewBook = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewBook)];
        
        self.navigationItem.rightBarButtonItem = addNewBook;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.shelves = [[self library] shelves];
    self.title = self.library.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Reload the data for the table view when it appears.
    
    [[self tableView] reloadData];
}

#pragma mark - Table View Protocol Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of secitions for the table view.
    
    NSArray *shelves = [[self library] shelves];
    
    return shelves.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows each section of the table view will have.
    
    NSArray *shelves = [[self library] shelves];
    
    Shelf *shelf = [shelves objectAtIndex:section];
    
    return shelf.books.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Return the title for each section of the table view
    
    NSArray *shelves = [[self library] shelves];
    
    Shelf *shelf = [shelves objectAtIndex:section];
    
    return shelf.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Define the custom appearance for each of the cells in the table view.
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSArray *shelves = [[self library] shelves];
    
    Shelf *shelf = [shelves objectAtIndex:indexPath.section];
    
    NSArray *books = [shelf books];
    
    Book *book = [books objectAtIndex:indexPath.row];
    
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.author;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Present the detail page for the book the user selects.
    
    NSArray *shelves = [[self library] shelves];
    
    Shelf *shelf = [shelves objectAtIndex:indexPath.section];
    
    NSArray *books = [shelf books];
    
    Book *book = [books objectAtIndex:indexPath.row];
    
    BookPageViewController *bookPage = [[BookPageViewController alloc] init];
    bookPage.selectedBook = book;
    
    [[self navigationController] presentViewController:bookPage animated:YES completion:nil];
}

- (void)addNewBook
{
    // Present the view controller that the user will create a new book with.
    
    NSArray *shelves = [[self library] shelves];
    
    NSMutableArray *categories = [NSMutableArray array];
    
    for (Shelf *aShelf in shelves) {
        [categories addObject:aShelf.name];
    }
    
    NewBookViewController *newBookPageViewController = [[NewBookViewController alloc] init];
    newBookPageViewController.delegate = self;
    newBookPageViewController.categories = categories;
    
    [[self navigationController] presentViewController:newBookPageViewController animated:YES completion:nil];
}

#pragma mark - New Book Delegate Protocol Methods

- (void)addNewBook:(Book *)theBook
{
    // ShelvesViewController is NewBookPageController's delegate.
    // When NewBookPageController sends this method to its delegate, it passes the book the user created.
    
    NSArray *shelves = [[self library] shelves];
    
    NSMutableArray *categories = [NSMutableArray array];
    
    for (Shelf *aShelf in shelves) {
        [categories addObject:aShelf.name];
    }
    
    NSUInteger bookCategoryIndex = [categories indexOfObjectIdenticalTo:theBook.category];
    
    Shelf *shelfToAddBook = [shelves objectAtIndex:bookCategoryIndex];
    
    [theBook addToShelf:shelfToAddBook];
    
    [[self tableView] reloadData];
}

@end








