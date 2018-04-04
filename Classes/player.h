//
//  player.h
//  bp
//
//  Created by David Bachor on 3/3/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface player : NSObject {
	
	NSInteger pid;
	NSInteger pgid;
	NSString *pname;
	NSString *pphone;
	NSString *pinitials;
	
	int blockCount;

}

@property (nonatomic, readwrite) NSInteger pid;
@property (nonatomic, readwrite) NSInteger pgid;
@property (nonatomic,retain) NSString *pname;
@property (nonatomic,retain) NSString *pphone;
@property (nonatomic,retain) NSString *pinitials;

-(void) incrementBlockCount;
-(void) decrementBlockCount;
-(int) getBlockCount;


- (id)initWithPlayer:(NSInteger)thePlayerId 
			   pgid:(NSInteger)theGameID
			   pname:(NSString *)thePlayerName
			  pphone:(NSString *)thePlayerPhone
		   pinitials:(NSString *)thePlayerInitiais;

@end
