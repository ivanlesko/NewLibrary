//
//  LibraryViewController.m
//  NewLibrary
//
//  Created by Ivan on 12/12/13.
//  Copyright (c) 2013 Ivan. All rights reserved.
//

#import "LibraryViewController.h"

@interface LibraryViewController ()

@end

@implementation LibraryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self populateLibraries];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the title for the view controller
    
    self.title = @"King County Libraries";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Reload the table when the view controller appears.
    
    [[self tableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections the table view will contain.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows the table view will contain.
    
    return libraries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Define the appearance of the cells that populate the table view.
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Library *library = [libraries objectAtIndex:indexPath.row];
    
    cell.textLabel.text = library.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d shelves", library.shelves.count];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Determine
    
    ShelvesViewController *shelvesViewController = [[ShelvesViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    Library *selectedLibrary = [libraries objectAtIndex:indexPath.row];
    
    shelvesViewController.library = selectedLibrary;
    
    [[self navigationController] pushViewController:shelvesViewController animated:YES];
}

-(void)populateLibraries
{
    // Create some initial data for the library view controller to display.
    
    Library *rentonLibrary = [[Library alloc] initWithName:@"Renton Library"];
    
    Library *bellevueLibrary = [[Library alloc] initWithName:@"Bellevue Library"];
    
    Library *fairwoodLibrary = [[Library alloc] initWithName:@"Fairwood Library"];
    
    Library *mercerIslandLibrary = [[Library alloc] initWithName:@"Mercer Island Library"];
    
    Library *kirklandLibrary = [[Library alloc] initWithName:@"Kirkland Library"];
    
    Shelf *fictionShelf = [[Shelf alloc] initWithShelfName:@"Fiction"];
    
    Shelf *teenShelf = [[Shelf alloc] initWithShelfName:@"Teen"];
    
    Shelf *comedyShelf = [[Shelf alloc] initWithShelfName:@"Comedy"];
    
    Shelf *sciFiShelf = [[Shelf alloc] initWithShelfName:@"Sci-Fi"];
    
    Shelf *mysteryShelf = [[Shelf alloc] initWithShelfName:@"Mystery"];
    
    // Fiction Books
    
    Book *theGoldfinch = [[Book alloc] initWithTitle:@"The Goldfinch" author:@"Donna Tartt" category:@"Fiction"];
    [theGoldfinch addToShelf:fictionShelf];
    
    Book *commandAuthority = [[Book alloc] initWithTitle:@"Command Authority" author:@"Tom Clancy" category:@"Fiction"];
    [commandAuthority addToShelf:fictionShelf];
    
    // Teen Books
    
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games" author:@"Suzanne Collins" category:@"Teen"];
    [hungerGames addToShelf:teenShelf];
    
    Book *theFaultInOurStars = [[Book alloc] initWithTitle:@"The Fault in Our Stars" author:@"John Green" category:@"Teen"];
    [theFaultInOurStars addToShelf:teenShelf];
    
    Book *theBookThief = [[Book alloc] initWithTitle:@"The Book Thief" author:@"Markus Zusak" category:@"Teen"];
    [theBookThief addToShelf:teenShelf];
    
    Book *theMazeRunner = [[Book alloc] initWithTitle:@"The Maze Runner" author:@"James Dashner" category:@"Teen"];
    [theMazeRunner addToShelf:teenShelf];
    
    // Comedy Books
    
    Book *meTalkPrettyOneDay = [[Book alloc] initWithTitle:@"Me Talk Pretty One Day" author:@"David Sedaris" category:@"Comedy"];
    [meTalkPrettyOneDay addToShelf:comedyShelf];
    
    Book *dirtyJob = [[Book alloc] initWithTitle:@"Dirty Job" author:@"Christopher Moore" category:@"Comedy"];
    [dirtyJob addToShelf:comedyShelf];
    
    // Sci-Fi Books
    
    Book *endersGame = [[Book alloc] initWithTitle:@"Ender's Game" author:@"Orson Scott Card" category:@"Sci-Fi"];
    [endersGame addToShelf:sciFiShelf];
    
    Book *dune = [[Book alloc] initWithTitle:@"Dune" author:@"Frank Herbert" category:@"Sci-Fi"];
    [dune addToShelf:sciFiShelf];
    
    // Mystery books
    
    Book *sixYears = [[Book alloc] initWithTitle:@"Six Years" author:@"Harlan Coben" category:@"Mystery"];
    [sixYears addToShelf:mysteryShelf];
    
    Book *doctorSleep = [[Book alloc] initWithTitle:@"Doctor Sleep" author:@"Stephan King" category:@"Mystery"];
    [doctorSleep addToShelf:mysteryShelf];
    
    Book *lightBetweenOceans = [[Book alloc] initWithTitle:@"Light Between Oceans" author:@"M.L. Stedman" category:@"Mystery"];
    [lightBetweenOceans addToShelf:mysteryShelf];
    
    libraries = [NSMutableArray arrayWithObjects:rentonLibrary, bellevueLibrary, fairwoodLibrary, mercerIslandLibrary, kirklandLibrary, nil];
    
    for (Library *aLibrary in libraries) {
        [aLibrary addShelf:fictionShelf];
        [aLibrary addShelf:teenShelf];
        [aLibrary addShelf:comedyShelf];
        [aLibrary addShelf:sciFiShelf];
        [aLibrary addShelf:mysteryShelf];
    }
}


@end
















