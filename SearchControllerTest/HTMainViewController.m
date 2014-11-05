//
//  HTMainViewController.m
//  SearchControllerTest
//
//  Created by Jason on 2014/11/5.
//  Copyright (c) 2014年 Zoaks. All rights reserved.
//

#import "HTMainViewController.h"

@interface HTMainViewController ()

@end

@implementation HTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    contentList = [[NSMutableArray alloc] initWithObjects:@"Happy Man", @"happyman", @"Happy Woman", @"Water Man", @"man", @"woman",@"human", @"happy", @"happyyy", nil];
    filteredContentList = [[NSMutableArray alloc] init];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (tableView == searchBarController.searchResultsTableView) {
        return [filteredContentList count];
    }
    else {
        return [contentList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (tableView == searchBarController.searchResultsTableView) {
        cell.textLabel.text = [filteredContentList objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [contentList objectAtIndex:indexPath.row];
    }
    return cell;
    
}

#pragma mark - Search Function Responsible For Searching

- (void)searchTableList {
    NSString *searchString = searchBar.text;
    
    for (NSString *tempStr in contentList) {
        NSComparisonResult result = [tempStr compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
        if (result == NSOrderedSame) {
            [filteredContentList addObject:tempStr];
        }
    }
}

#pragma mark - Search Bar Implementation

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    //Remove all objects first.
    [filteredContentList removeAllObjects];
    
    if([searchText length] != 0) {
        [self searchTableList];
    }
    else {
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}
@end
