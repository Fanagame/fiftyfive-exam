//
//  FFTreeNode.h
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFTreeNode : NSObject

/** references to the parent node in the tree. weak to avoid retain cycles */
@property (nonatomic, readonly, weak) FFTreeNode *parent;

@property (nonatomic, readonly) NSDictionary *nodes;

/** full recursive path of the node (A/B/C) */
@property (nonatomic, readonly) NSString *path;

/** those properties are pretty self explanatory */
@property (nonatomic, readonly) NSString *key;
@property (nonatomic, readonly) NSInteger value;


- (id) initWithKey:(NSString *)key parent:(FFTreeNode *)parent;
- (void) addValue:(NSInteger)value;
- (FFTreeNode *) nodeForKey:(NSString *)key;
- (void) print;

@end
