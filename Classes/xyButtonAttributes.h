//
//  xyButtonAttributes.h
//  bp2ipad
//
//  Created by David Bachor on 3/10/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XYBUTTONASSIGNED 300
#define XYBUTTONNOTASSIGNED 3001


@interface xyButtonAttributes : NSObject {
	
	UIButton *button;
	//NSInteger buttonTag;
	BOOL assigned;
	NSInteger playerAssigned;
	NSString *playerName;

}

@property (nonatomic, retain) UIButton *button;
@property (nonatomic, readwrite) NSInteger playerAssigned;
@property (nonatomic, readwrite) BOOL assigned;
@property (nonatomic, retain) NSString *playerName;

@end
