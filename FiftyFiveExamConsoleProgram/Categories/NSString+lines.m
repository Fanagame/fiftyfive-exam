//
//  NSString+lines.m
//  FiftyFiveExamConsoleProgram
//
//  Created by Rémy Bardou on 19/01/2015.
//  Copyright (c) 2015 Remy Bardou. All rights reserved.
//

#import "NSString+lines.h"

@implementation NSString (lines)

/** This code has been adapted from Apple's website:
	https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/stringsParagraphBreaks.html
 
	This is better than splitting on \n because it handles any type of line break
 */

- (NSArray *) stringByLine {
	NSUInteger length = [self length];
	NSUInteger paraStart = 0, paraEnd = 0, contentsEnd = 0;
	NSMutableArray *array = [NSMutableArray array];
	NSRange currentRange;
	
	while (paraEnd < length) {
		[self getParagraphStart:&paraStart end:&paraEnd
					  contentsEnd:&contentsEnd forRange:NSMakeRange(paraEnd, 0)];
		currentRange = NSMakeRange(paraStart, contentsEnd - paraStart);
		[array addObject:[self substringWithRange:currentRange]];
	}
	
	return array;
}

@end
