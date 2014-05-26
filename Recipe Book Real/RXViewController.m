//
//  RXViewController.m
//  Recipe Book Real
//
//  Created by Caleb Hicks on 5/22/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import "RXViewController.h"
#import "RXTableViewDataSource.h"
#import "RXRecipes.h"
#import "RXRecipeDetailViewController.h"


@interface RXViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RXTableViewDataSource *dataSource; // Must be strong to stay in memory, also, wtf is this data source doing // todo: find out why i am setting this property


@end

@implementation RXViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Recipe Book";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.separatorColor = [UIColor darkGrayColor];
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    RXTableViewDataSource *dataSource = [RXTableViewDataSource new];
    [dataSource registerTableView:tableView];
    self.dataSource = dataSource;
    
    tableView.dataSource = dataSource;
    self.tableView = tableView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // bring in the new view using the navigation controller
    
    // create instance of recipe detail view controller, set the recipeIndex property so we know what row they clicked, then push it to the stack
    RXRecipeDetailViewController *viewController = [RXRecipeDetailViewController new];
    viewController.recipeIndex = indexPath.row;
    [self.navigationController pushViewController:viewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
