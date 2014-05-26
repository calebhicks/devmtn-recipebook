//
//  RXRecipes.h
//  Recipe Book Real
//
//  Created by Caleb Hicks on 5/23/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXRecipes : NSObject

+ (NSInteger)count;
+ (NSDictionary *)recipeAtIndex:(NSInteger)index;
+ (NSString *)titleAtIndex:(NSInteger)index;
+ (NSString *)descriptionAtIndex:(NSInteger)index;
+ (NSInteger)ingredientCountAtIndex:(NSInteger)index;
+ (NSString *)ingredientTypeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;
+ (NSString *)ingredientVolumeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;
+ (NSArray *)directionsAtIndex:(NSInteger)index;
//+ (NSArray *)directions;

@end
