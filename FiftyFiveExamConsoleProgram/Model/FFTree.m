//
//  FFTree.m
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import "FFTree.h"
#import "FFTreeNode.h"
#import "NSString+lines.h"
#import "NSDictionary+sorting.h"

NSString * const kFFTreeParsing_KeyValueSeparator = @":";
NSString * const kFFTreeParsing_PathCharSetSeparators = @"./";

@interface FFTree () {
	NSMutableDictionary *_nodes;
}

@end

@implementation FFTree

- (id) init {
	self = [super init];
	if (self) {
		_nodes = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void) print {
	__weak FFTree *weakSelf = self;
	[[self.nodes sortedKeys] enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
		[weakSelf.nodes[key] print];
	}];
}

#pragma mark - Parsing

- (void) populateFromFile:(NSString *)filePath {
	NSError *error = nil;
	
	NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
	if (error) {
		NSLog(@"ERROR: %@", error);
		return;
	}
	
	[self populateFromString:content];
}

- (void) populateFromString:(NSString *)content {
	NSArray *lines = [content stringByLine];
	
	__weak FFTree *weakSelf = self;
	[lines enumerateObjectsUsingBlock:^(NSString *line, NSUInteger idx, BOOL *stop) {
		[weakSelf parseLine:line];
	}];
}

- (void) parseLine:(NSString *)line {
	/** line should look something like: "A2/B/C : 4"
		we'll make an array that looks like this:
		[0] = "A2/B/C "
		[1] = " 4"
		and parse it
	 */
	
	NSArray *arr = [line componentsSeparatedByString:kFFTreeParsing_KeyValueSeparator];
	
	if (arr.count != 2)
		return;
	
	NSString *key = [arr firstObject];
	NSInteger value = [[arr lastObject] integerValue];
	
	NSString *path = [key stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	
	[self saveValue:value forPath:path];
}

- (void) saveValue:(NSInteger)value forPath:(NSString *)path {
	/** path could be in A/B/C format or A.B.C format */
	NSArray *pathElements = [path componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:kFFTreeParsing_PathCharSetSeparators]];

	__block FFTreeNode *parentNode = nil;
	__weak FFTree *weakSelf = self;
	
	[pathElements enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
		
		if (!parentNode)
			parentNode = [weakSelf nodeForKey:key];
		else
			parentNode = [parentNode nodeForKey:key];
		
		[parentNode addValue:value];
	}];
}

#pragma mark - Nodes management

- (FFTreeNode *) nodeForKey:(NSString *)key {
	FFTreeNode *n = _nodes[key];
	if (!n) {
		n = [[FFTreeNode alloc] initWithKey:key parent:nil];
		_nodes[key] = n;
	}
	return n;
}

@end
