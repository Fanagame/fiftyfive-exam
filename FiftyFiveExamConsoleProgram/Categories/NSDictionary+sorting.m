//
//  NSDictionary+sorting.m
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import "NSDictionary+sorting.h"

@implementation NSDictionary (sorting)

-(NSArray *) sortedKeys {
	return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

@end
