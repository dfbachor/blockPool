//
//  block.m
//  bp2ipad
//
//  Created by David Bachor on 3/10/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import "block.h"


@implementation block

@synthesize bgid, bnumber, bpid, playerName;


- (id)initWithBlock:(NSInteger)theGameId 
			bnumber:(NSInteger)theBlockNumber
			   bpid:(NSInteger)thePlayerID
			 bpname:(NSString *)thePlayerName
		
{
	self.bgid = theGameId;
	self.bnumber = theBlockNumber;
	self.bpid = thePlayerID;
	self.playerName = thePlayerName;
	
	return self;
}


@end
