//
//  bp2ipadAppDelegate.h
//  bp2ipad
//
//  Created by David Bachor on 3/6/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "game.h"

@class bp2ipadViewController;

@interface bp2ipadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    bp2ipadViewController *viewController;
	
	NSString *dbname;
	NSString *dbpath;
	sqlite3 *database;
	sqlite3_stmt *selStmt;
	sqlite3_stmt *updStmt;
	sqlite3_stmt *insStmt;
	sqlite3_stmt *delStmt;
	
	BOOL copyDb;
	
	NSMutableArray *allGames;
	NSMutableArray *allPlayers;
	NSMutableArray *allBlocks;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet bp2ipadViewController *viewController;
@property (nonatomic, retain) NSMutableArray *allGames;
@property (nonatomic, retain) NSMutableArray *allPlayers;
@property (nonatomic, retain) NSMutableArray *allBlocks;

-(void) openDatabase;
-(BOOL) createDatabase;
-(void) closeDatabase;
-(void) readGames;
-(void) saveGame:(game *)agame;
-(void) updateGame:(game *)agame;
-(void) deleteGame:(int)theGameid;
-(void) readPlayers;
-(void) attachPlayerToGames;
-(void) deletePlayersByGameID:(int)theGameID;
-(int) saveNewPlayer:(player *)aplayer;
-(void) updatePlayer:(player *)aplayer;
-(void) deletePlayerByID:(int)thePlayerID;
-(int) getMaxPlayerID;
-(void) deleteBlock:(block *)ablock;
-(void) updateBlock:(block *)ablock;
-(void) attachBlocksToGames;
-(void) readBlocks;
-(void) deleteBlocksByGameID:(int)theGameID;
-(int) getMaxGameID;
-(void) deleteBlocksByPlayerID:(int)thePlayerID;

@end

