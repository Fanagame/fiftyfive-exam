//
//  main.m
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFTree.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		/** Step 1: scan files in folder */
		NSError *error = nil;
		
		NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resources"];
		NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
		
		if (error) {
			NSLog(@"FATAL ERROR: %@", error);
			return 0;
		}
		
		
		/** Step 2: parse files, build tree layout */
		FFTree *tree = [[FFTree alloc] init];
		
		[directoryContent enumerateObjectsUsingBlock:^(NSString *file, NSUInteger idx, BOOL *stop) {
			[tree populateFromFile:[path stringByAppendingPathComponent:file]];
		}];
		
		/** Step 3: show tree */
		[tree print];
	}
    return 0;
}
