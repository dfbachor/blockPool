//
//  block.h
//  bp2ipad
//
//  Created by David Bachor on 3/10/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface block : NSObject {
	
	NSInteger bgid;
	NSInteger bnumber;
	NSInteger bpid;
	NSString *playerName;
}

@property (nonatomic, readwrite) NSInteger bgid;
@property (nonatomic, readwrite) NSInteger bnumber;
@property (nonatomic, readwrite) NSInteger bpid;
@property (nonatomic, retain) NSString *playerName;

- (id)initWithBlock:(NSInteger)theGameId 
			bnumber:(NSInteger)theBlockNumber
			   bpid:(NSInteger)thePlayerID
			 bpname:(NSString *)thePlayerName;

@end
