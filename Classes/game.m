//
//  Game.m
//  bp
//
//  Created by David Bachor on 2/26/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import "game.h"

@implementation game

@synthesize gid;
@synthesize gname;
@synthesize xTeam;
@synthesize yTeam;
@synthesize gdate;
@synthesize wager;
@synthesize players;
@synthesize blocks;
@synthesize locked;
@synthesize x0, x1, x2, x3, x4, x5, x6, x7, x8, x9;
@synthesize y0, y1, y2, y3, y4, y5, y6, y7, y8, y9;
@synthesize xq1, xq2, xq3, xq4, yq1, yq2, yq3, yq4;

- (id)initWithGame:(NSInteger)theGameId 
			 gName:(NSString *)theGame
			 xTeam:(NSString *)theXTeam
			 yTeam:(NSString *)theYTeam
			 gdate:(NSString *)thegdate
			 wager:(NSNumber *)theWager
			locked:(NSInteger)theLocked
				x0:(NSInteger)thex0
				x1:(NSInteger)thex1
				x2:(NSInteger)thex2
				x3:(NSInteger)thex3
				x4:(NSInteger)thex4
				x5:(NSInteger)thex5
				x6:(NSInteger)thex6
				x7:(NSInteger)thex7
				x8:(NSInteger)thex8
				x9:(NSInteger)thex9
				y0:(NSInteger)they0
				y1:(NSInteger)they1
				y2:(NSInteger)they2
				y3:(NSInteger)they3
				y4:(NSInteger)they4
				y5:(NSInteger)they5
				y6:(NSInteger)they6
				y7:(NSInteger)they7
				y8:(NSInteger)they8
				y9:(NSInteger)they9
			   xq1:(NSString *)thexq1
			   xq2:(NSString *)thexq2
			   xq3:(NSString *)thexq3
			   xq4:(NSString *)thexq4
			   yq1:(NSString *)theyq1
			   yq2:(NSString *)theyq2
			   yq3:(NSString *)theyq3
			   yq4:(NSString *)theyq4
		  gplayers:(NSMutableArray *)thePlayers
		   gblocks:(NSMutableArray *)theBlocks
{
	self.gid = theGameId;
	self.gname = theGame;
	self.xTeam = theXTeam;
	self.yTeam = theYTeam;
	self.gdate = thegdate;
	self.wager = theWager;
	self.locked = theLocked;
	self.x0 = thex0;
	self.x1 = thex1;
	self.x2 = thex2;
	self.x3 = thex3;
	self.x4 = thex4;
	self.x5 = thex5;
	self.x6 = thex6;
	self.x7 = thex7;
	self.x8 = thex8;
	self.x9 = thex9;
	self.y0 = they0;
	self.y1 = they1;
	self.y2 = they2;
	self.y3 = they3;
	self.y4 = they4;
	self.y5 = they5;
	self.y6 = they6;
	self.y7 = they7;
	self.y8 = they8;
	self.y9 = they9;
	self.xq1 = thexq1;
	self.xq2 = thexq2;
	self.xq3 = thexq3;
	self.xq4 = thexq4;
	self.yq1 = theyq1;
	self.yq2 = theyq2;
	self.yq3 = theyq3;
	self.yq4 = theyq4;
	self.players = [[NSMutableArray alloc] init];
	self.blocks = [[NSMutableArray alloc] init];

	return self;	
}

- (void) dealloc
{
	[players release];
	[super dealloc];
}

@end
