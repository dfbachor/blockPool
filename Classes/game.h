//
//  game.h
//  bp
//
//  Created by David Bachor on 2/26/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	"player.h"
#import "block.h"

#define GAMELOCKED 1
#define GAMENOTLOCKED 0

@interface game : NSObject {

	NSInteger gid;
	NSString *gname;
	NSString *xTeam;
	NSString *yTeam;
	NSString *gdate;
	NSNumber *wager;
	NSInteger locked;
	
	NSMutableArray *players;
	NSMutableArray *blocks;
	
	NSInteger x0;
	NSInteger x1;
	NSInteger x2;
	NSInteger x3;
	NSInteger x4;
	NSInteger x5;
	NSInteger x6;
	NSInteger x7;
	NSInteger x8;
	NSInteger x9;
	NSInteger y0;
	NSInteger y1;
	NSInteger y2;
	NSInteger y3;
	NSInteger y4;
	NSInteger y5;
	NSInteger y6;
	NSInteger y7;
	NSInteger y8;
	NSInteger y9;
	
	NSString *xq1;
	NSString *xq2;
	NSString *xq3;
	NSString *xq4;
	NSString *yq1;
	NSString *yq2;
	NSString *yq3;
	NSString *yq4;
	
}

@property (nonatomic, readwrite) NSInteger gid;
@property (nonatomic, retain) NSString *gname;
@property (nonatomic, retain) NSString *xTeam;
@property (nonatomic, retain) NSString *yTeam;
@property (nonatomic, retain) NSString *gdate;
@property (nonatomic, retain) NSNumber *wager;
@property (nonatomic, retain) NSMutableArray *players;
@property (nonatomic, retain) NSMutableArray *blocks;
@property (nonatomic, readwrite) NSInteger locked;

@property (nonatomic, readwrite) NSInteger x0;
@property (nonatomic, readwrite) NSInteger x1;
@property (nonatomic, readwrite) NSInteger x2;
@property (nonatomic, readwrite) NSInteger x3;
@property (nonatomic, readwrite) NSInteger x4;
@property (nonatomic, readwrite) NSInteger x5;
@property (nonatomic, readwrite) NSInteger x6;
@property (nonatomic, readwrite) NSInteger x7;
@property (nonatomic, readwrite) NSInteger x8;
@property (nonatomic, readwrite) NSInteger x9;
@property (nonatomic, readwrite) NSInteger y0;
@property (nonatomic, readwrite) NSInteger y1;
@property (nonatomic, readwrite) NSInteger y2;
@property (nonatomic, readwrite) NSInteger y3;
@property (nonatomic, readwrite) NSInteger y4;
@property (nonatomic, readwrite) NSInteger y5;
@property (nonatomic, readwrite) NSInteger y6;
@property (nonatomic, readwrite) NSInteger y7;
@property (nonatomic, readwrite) NSInteger y8;
@property (nonatomic, readwrite) NSInteger y9;

@property (nonatomic, retain) NSString *xq1;
@property (nonatomic, retain) NSString *xq2;
@property (nonatomic, retain) NSString *xq3;
@property (nonatomic, retain) NSString *xq4;
@property (nonatomic, retain) NSString *yq1;
@property (nonatomic, retain) NSString *yq2;
@property (nonatomic, retain) NSString *yq3;
@property (nonatomic, retain) NSString *yq4;

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
		   gblocks:(NSMutableArray *)theBlocks;

@end
