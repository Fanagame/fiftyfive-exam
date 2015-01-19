//
//  FFTreeNode.m
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import "FFTreeNode.h"
#import "NSDictionary+sorting.h"

NSString * const kFFTreeNodePrintFormat_KeyValueSeparator = @":";
NSString * const kFFTreeNodePrintFormat_PathSeparator = @"/";

@interface FFTreeNode () {
	NSString *_path;
	NSMutableDictionary *_nodes;
}

@property (nonatomic, readwrite, weak) FFTreeNode *parent;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, assign) NSInteger value;

@end

@implementation FFTreeNode

- (id) initWithKey:(NSString *)key parent:(FFTreeNode *)parent {
	self = [super init];
	if (self) {
		self.key = key;
		_nodes = [[NSMutableDictionary alloc] init];
		self.parent = parent;
	}
	return self;
}

- (FFTreeNode *) nodeForKey:(NSString *)key {
	FFTreeNode *n = self.nodes[key];
	if (!n) {
		n = [[FFTreeNode alloc] initWithKey:key parent:self];
		_nodes[key] = n;
	}
	return n;
}

- (void) addValue:(NSInteger)value {
	self.value += value;
}

- (void) print {
	NSLog(@"%@ %@ %ld", self.path, kFFTreeNodePrintFormat_KeyValueSeparator, self.value);
	
	__weak FFTreeNode *weakSelf = self;
	[self.nodes.sortedKeys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
		[weakSelf.nodes[key] print];
	}];
}

- (NSString *) path {
	/** doing some lazy loaded caching here to avoid doing recursive stuff over and over again */
	if (!_path) {
		NSString *str = self.parent.path;
		
		if (str.length > 0)
			_path = [str stringByAppendingFormat:@"%@%@", kFFTreeNodePrintFormat_PathSeparator, self.key];
		else
			_path = self.key;
	}
	return _path;
}

@end
