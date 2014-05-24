//
//  RXTableViewDataSource.h
//  Recipe Book Real
//
//  Created by Caleb Hicks on 5/22/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;

@end
