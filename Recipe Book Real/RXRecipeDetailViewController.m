//
//  RXRecipeDetailViewController.m
//  Recipe Book Real
//
//  Created by Caleb Hicks on 5/24/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import "RXRecipeDetailViewController.h"
#import "RXRecipes.h"

@interface RXRecipeDetailViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RXRecipeDetailViewController

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
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.title = [RXRecipes titleAtIndex:self.recipeIndex];
    [self.view addSubview:self.scrollView];
    [self displayRecipe];
    
}

- (void)displayRecipe{
    
    NSInteger labelPlacement = 10;
    NSInteger sideMargins = 15;
    NSInteger topMargins = 30;
    
    CGFloat descriptionHeight = [self heightForDescription:[RXRecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *recipeDescription = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins, labelPlacement, self.view.frame.size.width-sideMargins*2, descriptionHeight)];
    recipeDescription.text = [RXRecipes descriptionAtIndex:self.recipeIndex];
    recipeDescription.font = [UIFont italicSystemFontOfSize:17];
    recipeDescription.numberOfLines = 0;
    recipeDescription.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.scrollView addSubview:recipeDescription];
    
    labelPlacement += descriptionHeight + topMargins;
    
    UILabel *ingredientsTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins, labelPlacement, self.view.frame.size.width-sideMargins*2, 40)];
    ingredientsTitleLabel.text = @"Ingredients";
    ingredientsTitleLabel.font = [UIFont boldSystemFontOfSize:19];
    [self.scrollView addSubview:ingredientsTitleLabel];
    
    labelPlacement += topMargins;
    
    for (int i = 0; i < [RXRecipes ingredientCountAtIndex:self.recipeIndex]-2; i++) {
        
        UILabel *ingredientVolume = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins, labelPlacement, self.view.frame.size.width-sideMargins*2, 40)];
        ingredientVolume.text = [RXRecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex]; //needs to loop through ingredient
        ingredientVolume.font = [UIFont boldSystemFontOfSize:17];
        [self.scrollView addSubview:ingredientVolume];
        
        UILabel *recipeIngredients = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins + 90, labelPlacement, self.view.frame.size.width-sideMargins*2, 40)];
        recipeIngredients.text = [RXRecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex]; //needs to loop through incredients
        [self.scrollView addSubview:recipeIngredients];
        
        labelPlacement += topMargins-5;
        
    }
    
    labelPlacement += topMargins;
    
    UILabel *directionsTitle = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins, labelPlacement, self.view.frame.size.width-sideMargins*2, 40)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:19];
    [self.scrollView addSubview:directionsTitle];
    
    labelPlacement += topMargins;
    
    for (int i = 0; i < [[RXRecipes directionsAtIndex:self.recipeIndex]count]; i++) {

        CGFloat directionsHeight = [self heightForDescription:[RXRecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *directions = [[UILabel alloc]initWithFrame:CGRectMake(sideMargins, labelPlacement, self.view.frame.size.width-sideMargins*2, directionsHeight)];
        directions.text = [RXRecipes directionsAtIndex:self.recipeIndex][i];
        directions.numberOfLines = 0;
        directions.lineBreakMode = NSLineBreakByWordWrapping;
        [self.scrollView addSubview:directions];
        
        labelPlacement += topMargins+directionsHeight;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, labelPlacement + topMargins);

    
}

- (CGFloat)heightForDescription:(NSString *)description{
    CGRect frameSize = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return frameSize.size.height;
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
