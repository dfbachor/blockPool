//
//  player.m
//  bp
//
//  Created by David Bachor on 3/3/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import "player.h"


@implementation player

@synthesize pid;
@synthesize pname;
@synthesize pphone;
@synthesize pinitials;
@synthesize pgid;


- (id)initWithPlayer:(NSInteger)thePlayerId 
				pgid:(NSInteger)theGameID
			   pname:(NSString *)thePlayerName
			  pphone:(NSString *)thePlayerPhone
		   pinitials:(NSString *)thePlayerInitiais

{
	self.pid = thePlayerId;
	self.pgid = theGameID;
	self.pname = thePlayerName;
	self.pphone = thePlayerPhone;
	self.pinitials = thePlayerInitiais;
	
	blockCount=0;
	
	return self;
}


-(void) incrementBlockCount
{
	blockCount++;
}

-(void) decrementBlockCount
{
	blockCount--;
}

-(int) getBlockCount
{
	return blockCount;
}



@end

