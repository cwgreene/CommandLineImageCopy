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
#import <Foundation/NSFileManager.h>
#import <Appkit/NSImage.h>

int main( int argc, const char* argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *filename;
	
	if(argc < 2)
	{
		printf("Please specify image path\n");
		exit(-1);
	}
	filename = [NSString stringWithCString:argv[1]];
	if([[NSFileManager defaultManager] fileExistsAtPath:filename] != TRUE)
	{
		printf("Invalid file location\n");
		exit(-2);
	}
	NSImage *controlImage = [[NSImage alloc] initWithContentsOfFile:filename];
	if(controlImage == nil)
	{
		printf("Invalid file format\n");
		exit(-2);
	}
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	NSInteger changecount = [pasteboard clearContents];
	NSArray *objects = [[NSArray alloc] initWithObjects:controlImage];
	[pasteboard writeObjects:objects];
	[pool release];
	return 0;
}