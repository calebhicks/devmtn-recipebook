//
//  RXTableViewDataSource.m
//  Recipe Book Real
//
//  Created by Caleb Hicks on 5/22/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import "RXTableViewDataSource.h"
#import "RXRecipes.h"

static NSString * const cellIdentifier = @"identifier";

@implementation RXTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [RXRecipes titleAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RXRecipes count];
}



- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end