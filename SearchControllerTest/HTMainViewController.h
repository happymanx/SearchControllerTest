//
//  HTMainViewController.h
//  SearchControllerTest
//
//  Created by Jason on 2014/11/5.
//  Copyright (c) 2014年 Zoaks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMainViewController : UIViewController
{
    // UI
    IBOutlet UITableView *displayTableView;
    IBOutlet UISearchBar *searchBar;
    IBOutlet UISearchDisplayController *searchBarController;
    
    // Control
    
    // Data
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
}

@end
