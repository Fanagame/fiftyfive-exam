//
//  FFTree.h
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFTree : NSObject

@property (nonatomic, readonly) NSDictionary *nodes;

/** adds new nodes to the existing tree based on the file content */
- (void) populateFromFile:(NSString *)filePath;

/** adds new nodes to the existing tree based on the provided content */
- (void) populateFromString:(NSString *)content;

/** prints ALL the nodes in the tree (calls print on all nodes) */
- (void) print;

@end
