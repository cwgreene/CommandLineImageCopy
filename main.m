/*
 *  main.m
 *  CommandLineImageCopy
 *
 *  Created by Christopher Greene on 5/5/11.
 *  Copyright 2011 UCSC. All rights reserved.
 *
 */

#include "main.h"

#import <Foundation/foundation.h>
#import <Appkit/NSImage.h>

int main( int argc, const char* argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *filename;
	
	if(argc < 2)
	{
		printf("Please specify image path\n");
		exit(0);
	}
	filename = [NSString stringWithCString:argv[1]];
	NSImage *controlImage = [[NSImage alloc] initWithContentsOfFile:filename];
	printf("Success\n");
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	NSInteger changecount = [pasteboard clearContents];
	NSArray *objects = [[NSArray alloc] initWithObjects:controlImage];
	[pasteboard writeObjects:objects];
	[pool release];
	return 0;
}