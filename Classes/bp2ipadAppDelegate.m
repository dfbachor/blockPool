//
//  bp2ipadAppDelegate.m
//  bp2ipad
//
//  Created by David Bachor on 3/6/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import "bp2ipadAppDelegate.h"
#import "bp2ipadViewController.h"

@implementation bp2ipadAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize allGames;
@synthesize allPlayers;
@synthesize allBlocks;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	copyDb = TRUE;
	
	dbname = @"bp.sqlite";
	
	//get the directory name
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *path = [paths objectAtIndex:0];
	dbpath = [path stringByAppendingPathComponent:dbname];
	NSLog(@"database path = %@", dbpath);
	
	// open the datbaase and read the laons
	database = nil;
	selStmt = nil;
	updStmt = nil;
	insStmt = nil;
	delStmt = nil;
	[self openDatabase];
	[self readGames];
    
	// generated code
	[self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark database

/*******************************************************************************************************************/


-(void) saveGame:(game *)agame
{
	int ret; // return code
	const char *sql = "insert into games (name, xName, yName, gameDate, costPerBlock, locked, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, xQ1score, xQ2score, xQ3score, xQ4score, yQ1score, yQ2score, yQ3score, yQ4score ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	
	if (!insStmt)
	{ // first insert - build statement
		if ((ret=sqlite3_prepare_v2(database, sql, -1, &insStmt, NULL))!=SQLITE_OK)
		{
			NSAssert1(0, @"Error building statement to insert game [%s]", sqlite3_errmsg(database));
		}
	}
	
	// bind values
	
	//NSString * = (NSString *)theldate;
	//if (dayte==NULL) dayte = @"";
	sqlite3_bind_text(insStmt, 1, [agame.gname UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(insStmt, 2, [agame.xTeam UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(insStmt, 3, [agame.yTeam UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(insStmt, 4, [agame.gdate UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_double(insStmt, 5, [agame.wager doubleValue]);
	sqlite3_bind_int(insStmt, 6, agame.locked);
	sqlite3_bind_int(insStmt, 7, agame.x0);
	sqlite3_bind_int(insStmt, 8, agame.x1);
	sqlite3_bind_int(insStmt, 9, agame.x2);
	sqlite3_bind_int(insStmt, 10, agame.x3);
	sqlite3_bind_int(insStmt, 11, agame.x4);
	sqlite3_bind_int(insStmt, 12, agame.x5);
	sqlite3_bind_int(insStmt, 13, agame.x6);
	sqlite3_bind_int(insStmt, 14, agame.x7);
	sqlite3_bind_int(insStmt, 15, agame.x8);
	sqlite3_bind_int(insStmt, 16, agame.x9);
	sqlite3_bind_int(insStmt, 17, agame.x0);
	sqlite3_bind_int(insStmt, 18, agame.y1);
	sqlite3_bind_int(insStmt, 19, agame.y2);
	sqlite3_bind_int(insStmt, 20, agame.y3);
	sqlite3_bind_int(insStmt, 21, agame.y4);
	sqlite3_bind_int(insStmt, 22, agame.y5);
	sqlite3_bind_int(insStmt, 23, agame.y6);
	sqlite3_bind_int(insStmt, 24, agame.y7);
	sqlite3_bind_int(insStmt, 25, agame.y8);
	sqlite3_bind_int(insStmt, 26, agame.y9);
    sqlite3_bind_text(insStmt, 27, [agame.xq1 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 28, [agame.xq2 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 29, [agame.xq3 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 30, [agame.xq4 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 31, [agame.yq1 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 32, [agame.yq1 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 33, [agame.yq3 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insStmt, 34, [agame.yq4 UTF8String], -1, SQLITE_TRANSIENT);
	
	// now execute sql statement
	if ((ret=sqlite3_step(insStmt)) != SQLITE_DONE)
	{
		NSAssert1(0, @"Error inserting game [%s]", sqlite3_errmsg(database));
	}
	
	// now reset bound statement to original state
	sqlite3_reset(insStmt);
	insStmt = nil;
}
/*******************************************************************************************************************/

-(void) updateGame:(game *)agame
{
	
	int ret; // return code
	const char *sql = "UPDATE games set name = ?, xName = ?, yName = ?, gameDate = ?, costPerBlock = ?,  locked = ?, x0 = ?, x1 = ?, x2 = ?, x3 = ?, x4 = ?, x5 = ?, x6 = ?, x7 = ?, x8 = ?, x9 = ?, y0 = ?, y1 = ?, y2 = ?, y3 = ?, y4 = ?, y5 = ?, y6 = ?, y7 = ?, y8 = ?, y9 = ?, xQ1score = ?, xQ2score = ?, xQ3score = ?, xQ4score = ?, yQ1score = ?, yQ2score = ?, yQ3score = ?, yQ4score = ? where id = ?";
	
	if (!updStmt)
	{ // first insert - build statement
		if ((ret=sqlite3_prepare_v2(database, sql, -1, &updStmt, NULL))!=SQLITE_OK)
		{
			NSAssert1(0, @"Error building statement to update games [%s]", sqlite3_errmsg(database));
		}
	}
	
	sqlite3_bind_text(updStmt, 1, [agame.gname UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(updStmt, 2, [agame.xTeam UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(updStmt, 3, [agame.yTeam UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(updStmt, 4, [agame.gdate UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_double(updStmt, 5, [agame.wager doubleValue]);
	sqlite3_bind_int(updStmt, 6, agame.locked);
	sqlite3_bind_int(updStmt, 7, agame.x0);
	sqlite3_bind_int(updStmt, 8, agame.x1);
	sqlite3_bind_int(updStmt, 9, agame.x2);
	sqlite3_bind_int(updStmt, 10, agame.x3);
	sqlite3_bind_int(updStmt, 11, agame.x4);
	sqlite3_bind_int(updStmt, 12, agame.x5);
	sqlite3_bind_int(updStmt, 13, agame.x6);
	sqlite3_bind_int(updStmt, 14, agame.x7);
	sqlite3_bind_int(updStmt, 15, agame.x8);
	sqlite3_bind_int(updStmt, 16, agame.x9);
	sqlite3_bind_int(updStmt, 17, agame.y0);
	sqlite3_bind_int(updStmt, 18, agame.y1);
	sqlite3_bind_int(updStmt, 19, agame.y2);
	sqlite3_bind_int(updStmt, 20, agame.y3);
	sqlite3_bind_int(updStmt, 21, agame.y4);
	sqlite3_bind_int(updStmt, 22, agame.y5);
	sqlite3_bind_int(updStmt, 23, agame.y6);
	sqlite3_bind_int(updStmt, 24, agame.y7);
	sqlite3_bind_int(updStmt, 25, agame.y8);
	sqlite3_bind_int(updStmt, 26, agame.y9);
    sqlite3_bind_text(updStmt, 27, [agame.xq1 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 28, [agame.xq2 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 29, [agame.xq3 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 30, [agame.xq4 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 31, [agame.yq1 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 32, [agame.yq2 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 33, [agame.yq3 UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updStmt, 34, [agame.yq4 UTF8String], -1, SQLITE_TRANSIENT);
	
	sqlite3_bind_int(updStmt, 35, agame.gid);
	
	// now execute sql statement
	if ((ret=sqlite3_step(updStmt)) != SQLITE_DONE)
	{
		NSAssert1(0, @"Error updating loan [%s]", sqlite3_errmsg(database));
	}
	
	// now reset bound statement to original state
	sqlite3_reset(updStmt);
	updStmt = nil;	
}


/*******************************************************************************************************************/


-(void) openDatabase
{
	BOOL ok;
	NSError *error;
	
	allGames = [[NSMutableArray alloc] init];
	allPlayers = [[NSMutableArray alloc] init];
	allBlocks = [[NSMutableArray alloc] init];
	
	// determine if the database exists
	NSFileManager *fm = [NSFileManager defaultManager];
	ok = [fm fileExistsAtPath:dbpath];
	
	if(!ok)
	{
		if(copyDb)
		{
			NSString *appPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbname];
			ok = [fm copyItemAtPath:appPath toPath:dbpath error:&error];
			NSLog(@"database path = %@", appPath);

		}
	}
	[fm release];
	
	if (sqlite3_open([dbpath UTF8String], &database) != SQLITE_OK)
	{
		sqlite3_close(database);
		database = nil;
	}
	
	if (!copyDb && !ok)
	{
		ok = [self createDatabase]; // create empty database
	}
	
	if (!ok)
	{
		NSAssert1(0, @"Problem creating the database [%@]", [error localizedDescription]);
		
	}
	
}
/*******************************************************************************************************************/

- (BOOL) createDatabase
{
	
	BOOL ret;
	int rc;
	
	const char *createGamesSQL = 
	"CREATE TABLE 'games' ( 'id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' TEXT, 'yName' TEXT, 'xName' TEXT, 'gameDate' DATETIME, 'costPerBlock' INTEGER, 'x0' INTEGER, 'x1' INTEGER, 'x2' INTEGER, 'x3' INTEGER, 'x4' INTEGER, 'x5' INTEGER, 'x6' INTEGER, 'x7' INTEGER, 'x8' INTEGER, 'x9' INTEGER , 'y0' INTEGER, 'y1' INTEGER, 'y2' INTEGER, 'y3' INTEGER, 'y4' INTEGER, 'y5' INTEGER, 'y6' INTEGER, 'y7' INTEGER, 'y8' INTEGER, 'y9' INTEGER, 'yQ1score' TEXT, 'yQ2score' TEXT, 'yQ3score' TEXT, 'yQ4score' TEXT, 'xQ1score' TEXT, 'xQ2score' TEXT, 'xQ3score' TEXT, 'xQ4score' TEXT,'locked' INTEGER)";
	
	sqlite3_stmt *stmt;
	rc = sqlite3_prepare_v2(database, createGamesSQL, -1, &stmt, NULL);
	NSLog(@"create database returned [%d]",rc);
	
	
	ret = (rc == SQLITE_OK);
	if(ret)
	{
		rc = sqlite3_step(stmt);
		NSLog(@"step returned [%d]", rc);
		ret = (rc == SQLITE_DONE);	 
	}
	
	sqlite3_finalize(stmt);
	
	
	
	const char *createCustomerSQL2 = 
	"CREATE TABLE 'players'  ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' TEXT, 'phone' TEXT, 'initials' TEXT, 'gameID' INTEGER)";
	
	sqlite3_stmt *stmt2;
	rc = sqlite3_prepare_v2(database, createCustomerSQL2, -1, &stmt2, NULL);
	NSLog(@"{re[are returned [%d]",rc);
	
	
	ret = (rc == SQLITE_OK);
	if(ret)
	{
		rc = sqlite3_step(stmt2);
		NSLog(@"step returned [%d]", rc);
		ret = (rc == SQLITE_DONE);	 
	}
	
	sqlite3_finalize(stmt2);
	
	
	
	const char *createCustomerSQL3 = 
	"CREATE TABLE blocks  (bgameID INTEGER,  bnumber  INTEGER,  bplayerID INTEGER, bpname TEXT, PRIMARY KEY (bgameID, bnumber))";
	
	sqlite3_stmt *stmt3;
	rc = sqlite3_prepare_v2(database, createCustomerSQL3, -1, &stmt3, NULL);
	NSLog(@"{re[are returned [%d]",rc);
	
	
	ret = (rc == SQLITE_OK);
	if(ret)
	{
		rc = sqlite3_step(stmt3);
		NSLog(@"step returned [%d]", rc);
		ret = (rc == SQLITE_DONE);	 
	}
	
	sqlite3_finalize(stmt3);
	

	return ret;
}

/*******************************************************************************************************************/
- (void) closeDatabase
{
	sqlite3_finalize(selStmt);
	sqlite3_finalize(updStmt);
	sqlite3_finalize(insStmt);	
	sqlite3_finalize(delStmt);
	sqlite3_close(database);
}
/*******************************************************************************************************************/

-(void) deleteGame:(int)theGameid
{
	//if(!database) return FALSE;
	
	if(!delStmt)
	{
		const char *sql = "DELETE from games where id = ?";
		
		if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
		{
			delStmt = nil;
		}
	}
	
	if(!delStmt)
	{
		NSAssert1(0,@"Can't build SQL to delete game [%s]", sqlite3_errmsg(database));
	}
	
	NSInteger gid = theGameid;
	sqlite3_bind_int(delStmt, 1, gid);
	
	
	if ((sqlite3_step(delStmt)) == SQLITE_DONE)
	{
		NSLog(@"game deleted!");
	}
	else 
	{
		NSLog(@"game not deleted for some reason!");
	}
	
	sqlite3_reset(delStmt); 
	delStmt = nil;
	[self deletePlayersByGameID:theGameid];
	[self deleteBlocksByGameID:theGameid];
}

/*******************************************************************************************************************/

-(void) deletePlayersByGameID:(int)theGameID
{
	if(!delStmt)
	{
		const char *sql = "DELETE from players where gameID = ?";
		
		if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
		{
			delStmt = nil;
		}
	}
	
	if(!delStmt)
	{
		NSAssert1(0,@"Can't build SQL to delete players [%s]", sqlite3_errmsg(database));
	}
	
	NSInteger gId = theGameID;
	sqlite3_bind_int(delStmt, 1, gId);
	
	
	if ((sqlite3_step(delStmt)) == SQLITE_DONE)
	{
		NSLog(@"players by game deleted!");
	}
	else 
	{
		NSLog(@"players by loan not deleted for some reason!");
	}
	
	
	sqlite3_reset(delStmt); 
	delStmt = nil;
	
	
}
/*******************************************************************************************************************/

-(void) deleteBlocksByGameID:(int)theGameID
{
	if(!delStmt)
	{
		const char *sql = "DELETE from blocks where bgameID = ?";
		
		if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
		{
			delStmt = nil;
		}
	}
	
	if(!delStmt)
	{
		NSAssert1(0,@"Can't build SQL to delete blocks [%s]", sqlite3_errmsg(database));
	}
	
	NSInteger gId = theGameID;
	sqlite3_bind_int(delStmt, 1, gId);
	
	
	if ((sqlite3_step(delStmt)) == SQLITE_DONE)
	{
		NSLog(@"blocks by game deleted!");
	}
	else 
	{
		NSLog(@"blocks by game not deleted for some reason!");
	}
	
	
	sqlite3_reset(delStmt); 
	delStmt = nil;
	
	
}
/*******************************************************************************************************************/

-(void) readGames
{
	if(!database) return;
	
	if(!selStmt)
	{
		const char *sql = "SELECT id, name, xName, yName, gameDate, costPerBlock, locked, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, xQ1score, xQ2score, xQ3score, xQ4score, yQ1score, yQ2score, yQ3score, yQ4score from games";
		
		if(sqlite3_prepare_v2(database, sql, -1, &selStmt, NULL) != SQLITE_OK)
		{
			selStmt = nil;
		}
	}
	
	if(!selStmt)
	{
		NSAssert1(0,@"Can't build SQL to read games [%s]", sqlite3_errmsg(database));
	}
	
	[allGames removeAllObjects];
	
	int ret;
	
	while ((ret = sqlite3_step(selStmt)) == SQLITE_ROW)
	{
		NSInteger gid = sqlite3_column_int(selStmt, 0);
		char *gname = (char *)sqlite3_column_text(selStmt, 1);
		char *gXname = (char *)sqlite3_column_text(selStmt, 2);
		char *gYname = (char *)sqlite3_column_text(selStmt, 3);
		char *gdayte = (char *)sqlite3_column_text(selStmt, 4);
		NSNumber *gwager = [NSNumber numberWithFloat:(float)sqlite3_column_double(selStmt, 5)];	
		NSInteger glocked = sqlite3_column_int(selStmt, 6);
		NSInteger x0 = sqlite3_column_int(selStmt, 7);
		NSInteger x1 = sqlite3_column_int(selStmt, 8);
		NSInteger x2 = sqlite3_column_int(selStmt, 9);
		NSInteger x3 = sqlite3_column_int(selStmt, 10);
		NSInteger x4 = sqlite3_column_int(selStmt, 11);
		NSInteger x5 = sqlite3_column_int(selStmt, 12);
		NSInteger x6 = sqlite3_column_int(selStmt, 13);
		NSInteger x7 = sqlite3_column_int(selStmt, 14);
		NSInteger x8 = sqlite3_column_int(selStmt, 15);
		NSInteger x9 = sqlite3_column_int(selStmt, 16);
		NSInteger y0 = sqlite3_column_int(selStmt, 17);
		NSInteger y1 = sqlite3_column_int(selStmt, 18);
		NSInteger y2 = sqlite3_column_int(selStmt, 19);
		NSInteger y3 = sqlite3_column_int(selStmt, 20);
		NSInteger y4 = sqlite3_column_int(selStmt, 21);
		NSInteger y5 = sqlite3_column_int(selStmt, 22);
		NSInteger y6 = sqlite3_column_int(selStmt, 23);
		NSInteger y7 = sqlite3_column_int(selStmt, 24);
		NSInteger y8 = sqlite3_column_int(selStmt, 25);
		NSInteger y9 = sqlite3_column_int(selStmt, 26);
        
		char *xq1 = (char *)sqlite3_column_text(selStmt, 27);
		char *xq2 = (char *)sqlite3_column_text(selStmt, 28);
		char *xq3 = (char *)sqlite3_column_text(selStmt, 29);
		char *xq4 = (char *)sqlite3_column_text(selStmt, 30);
		char *yq1 = (char *)sqlite3_column_text(selStmt, 31);
		char *yq2 = (char *)sqlite3_column_text(selStmt, 32);
		char *yq3 = (char *)sqlite3_column_text(selStmt, 33);
		char *yq4 = (char *)sqlite3_column_text(selStmt, 34);
		
		
		game *aGame = [[game alloc] initWithGame:gid 
									       gName:[NSString stringWithUTF8String:(char *)gname]
										   xTeam:[NSString stringWithUTF8String:(char *)gXname]
										   yTeam:[NSString stringWithUTF8String:(char *)gYname]
										   gdate:[NSString stringWithUTF8String:(char *)gdayte]
										   wager:gwager
										  locked:glocked
											  x0:x0
											  x1:x1
											  x2:x2
											  x3:x3
											  x4:x4
											  x5:x5
											  x6:x6
											  x7:x7
											  x8:x8
											  x9:x9
											  y0:y0
											  y1:y1
											  y2:y2
											  y3:y3
											  y4:y4
											  y5:y5
											  y6:y6
											  y7:y7
											  y8:y8
											  y9:y9
											xq1:[NSString stringWithUTF8String:(char *)xq1]
											xq2:[NSString stringWithUTF8String:(char *)xq2]
											xq3:[NSString stringWithUTF8String:(char *)xq3]
											xq4:[NSString stringWithUTF8String:(char *)xq4]
											yq1:[NSString stringWithUTF8String:(char *)yq1]
											yq2:[NSString stringWithUTF8String:(char *)yq2]
											yq3:[NSString stringWithUTF8String:(char *)yq3]
											yq4:[NSString stringWithUTF8String:(char *)yq4]
										gplayers:nil
										 gblocks:nil];
		
		[allGames addObject:aGame];
		[aGame release];
		
	} //while
	
	sqlite3_reset(selStmt);
	selStmt = nil;
	
	[self attachPlayerToGames];
	[self attachBlocksToGames];
	
}

/*******************************************************************************************************************/

-(void) readPlayers
{
	if(!database) return;
	
	if(!selStmt)
	{
		const char *sql = "SELECT p.id, p.name, p.phone, p.initials, p.gameID from players p";
		
		if(sqlite3_prepare_v2(database, sql, -1, &selStmt, NULL) != SQLITE_OK)
		{
			selStmt = nil;
		}
	}
	
	if(!selStmt)
	{
		NSAssert1(0,@"Can't build SQL to read players [%s]", sqlite3_errmsg(database));
	}
	
	[allPlayers removeAllObjects];
	
	int ret;
	
	while ((ret = sqlite3_step(selStmt)) == SQLITE_ROW)
	{
		NSInteger pid = sqlite3_column_int(selStmt, 0);
		char *pname = (char *)sqlite3_column_text(selStmt, 1);
		char *pphone = (char *)sqlite3_column_text(selStmt, 2);
		//char *pinitials = (char *)sqlite3_column_text(selStmt, 3);
		sqlite3_column_text(selStmt, 3); // not using this field
		NSInteger gid = sqlite3_column_int(selStmt, 4);
		
		player *aPlayer = [[player alloc] initWithPlayer:pid 
													pgid:gid
												   pname:[NSString stringWithUTF8String:(char *)pname]
												  pphone:[NSString stringWithUTF8String:(char *)pphone]
											   pinitials:nil];
		
		[allPlayers addObject:aPlayer];
		[aPlayer release];
		
	} //while
	
	sqlite3_reset(selStmt);
	selStmt = nil;
	
}
/*******************************************************************************************************************/

-(void) updatePlayer:(player *)aplayer
{
	int ret; // return code
	const char *sql = "UPDATE players set name = ?, phone = ?, initials = ? where id = ?";
	
	if (!updStmt)
	{ // first insert - build statement
		if ((ret=sqlite3_prepare_v2(database, sql, -1, &updStmt, NULL))!=SQLITE_OK)
		{
			NSAssert1(0, @"Error building statement to update players [%s]", sqlite3_errmsg(database));
		}
	}
	
	sqlite3_bind_text(updStmt, 1, [aplayer.pname UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(updStmt, 2, [aplayer.pphone UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(updStmt, 3, [aplayer.pinitials UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(updStmt, 4, aplayer.pid);
	
	
	// now execute sql statement
	if ((ret=sqlite3_step(updStmt)) != SQLITE_DONE)
	{
		NSAssert1(0, @"Error updating loan [%s]", sqlite3_errmsg(database));
	}
	
	// now reset bound statement to original state
	sqlite3_reset(updStmt);
	updStmt = nil;	
	
}

/*******************************************************************************************************************/

-(int) saveNewPlayer:(player *)aplayer
{
	int ret; // return code
	const char *sql = "insert into players (name, phone, initials, gameID) values (?, ?, ?, ?);";
	
	if (!insStmt)
	{ // first insert - build statement
		if ((ret=sqlite3_prepare_v2(database, sql, -1, &insStmt, NULL))!=SQLITE_OK)
		{
			NSAssert1(0, @"Error building statement to insert players [%s]", sqlite3_errmsg(database));
		}
	}
	
	// bind values
	
	//NSString * = (NSString *)theldate;
	//if (dayte==NULL) dayte = @"";
	sqlite3_bind_text(insStmt, 1, [aplayer.pname UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(insStmt, 2, [aplayer.pphone UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(insStmt, 3, [aplayer.pinitials UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_int(insStmt, 4, aplayer.pgid);

	// now execute sql statement
	if ((ret=sqlite3_step(insStmt)) != SQLITE_DONE)
	{
		NSAssert1(0, @"Error inserting player [%s]", sqlite3_errmsg(database));
	}
	
	// now reset bound statement to original state
	sqlite3_reset(insStmt);
	insStmt = nil;
	return [self getMaxPlayerID];
}
/*******************************************************************************************************************/

-(int) getMaxPlayerID
{
	if(!database) return -1;
	
	int pid=0;
	
	if(!selStmt)
	{
		const char *sql = "select max(id) from players";
		
		if(sqlite3_prepare_v2(database, sql, -1, &selStmt, NULL) != SQLITE_OK)
		{
			selStmt = nil;
		}
	}
	
	if(!selStmt)
	{
		NSAssert1(0,@"Can't build SQL to read max id from players [%s]", sqlite3_errmsg(database));
	}
	
	//[allPlayers removeAllObjects];
	
	int ret;
	
	while ((ret = sqlite3_step(selStmt)) == SQLITE_ROW)
	{
		pid = sqlite3_column_int(selStmt, 0);
	} //while
	
	sqlite3_reset(selStmt);
	selStmt = nil;
	return pid;
}	

/*******************************************************************************************************************/

-(int) getMaxGameID
{
	if(!database) return -1;
	
	int pid=0;
	
	if(!selStmt)
	{
		const char *sql = "select max(id) from games";
		
		if(sqlite3_prepare_v2(database, sql, -1, &selStmt, NULL) != SQLITE_OK)
		{
			selStmt = nil;
		}
	}
	
	if(!selStmt)
	{
		NSAssert1(0,@"Can't build SQL to read max id from games [%s]", sqlite3_errmsg(database));
	}
		
	int ret;
	
	while ((ret = sqlite3_step(selStmt)) == SQLITE_ROW)
	{
		pid = sqlite3_column_int(selStmt, 0);
	} //while
	
	sqlite3_reset(selStmt);
	selStmt = nil;
	return pid;
}	

/*******************************************************************************************************************/

-(void) deletePlayerByID:(int)thePlayerID
{
    if(!delStmt)
    {
        const char *sql = "DELETE from players where id = ?";
        
        if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
        {
            delStmt = nil;
        }
    }
    
    if(!delStmt)
    {
        NSAssert1(0,@"Can't build SQL to delete player [%s]", sqlite3_errmsg(database));
    }
    
    NSInteger pid = thePlayerID;
    sqlite3_bind_int(delStmt, 1, pid);
    
    
    if ((sqlite3_step(delStmt)) == SQLITE_DONE)
    {
        NSLog(@"players by id deleted!");
    }
    else 
    {
        NSLog(@"players by id not deleted for some reason!");
    }
    
    
    sqlite3_reset(delStmt); 
    delStmt = nil;
    
    [self deleteBlocksByPlayerID:thePlayerID];
    
}/*******************************************************************************************************************/

-(void) deleteBlocksByPlayerID:(int)thePlayerID
{
    if(!delStmt)
    {
        const char *sql = "DELETE from blocks where bplayerID = ?";
        
        if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
        {
            delStmt = nil;
        }
    }
    
    if(!delStmt)
    {
        NSAssert1(0,@"Can't build SQL to delete blockd by playerID [%s]", sqlite3_errmsg(database));
    }
    
    NSInteger pid = thePlayerID;
    sqlite3_bind_int(delStmt, 1, pid);
    
    
    if ((sqlite3_step(delStmt)) == SQLITE_DONE)
    {
        NSLog(@"blocks by player  by id deleted!");
    }
    else 
    {
        NSLog(@"blocks by players id not deleted for some reason!");
    }
    
    
    sqlite3_reset(delStmt); 
    delStmt = nil;
    
}


/*******************************************************************************************************************/

-(void) readBlocks
{
	if(!database) return;
	
	if(!selStmt)
	{
		const char *sql = "SELECT bgameID, bnumber, bplayerID, bpname from blocks";
		
		if(sqlite3_prepare_v2(database, sql, -1, &selStmt, NULL) != SQLITE_OK)
		{
			selStmt = nil;
		}
	}
	
	if(!selStmt)
	{
		NSAssert1(0,@"Can't build SQL to read items [%s]", sqlite3_errmsg(database));
	}
	
	[allBlocks removeAllObjects];
	
	int ret;
	
	while ((ret = sqlite3_step(selStmt)) == SQLITE_ROW)
	{
		NSInteger gid = sqlite3_column_int(selStmt, 0);
		NSInteger bid = sqlite3_column_int(selStmt, 1);
		NSInteger pid = sqlite3_column_int(selStmt, 2);
		char *bpName = (char *)sqlite3_column_text(selStmt, 3);

		
		block *aBlock = [[block alloc] initWithBlock:gid 
									       bnumber:bid
										   bpid:pid
										 bpname:[NSString stringWithUTF8String:(char *)bpName]];
		
		[allBlocks addObject:aBlock];
		[aBlock release];
		
	} //while
	
	sqlite3_reset(selStmt);
	selStmt = nil;
	
	// [self attachPlayerToGames];
	
}

/*******************************************************************************************************************/

-(void) deleteBlock:(block *)ablock
{
	if(!delStmt)
	{
		const char *sql = "DELETE from blocks where bgameID = ? and bnumber = ?";
		
		if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK)
		{
			delStmt = nil;
		}
	}
	
	if(!delStmt)
	{
		NSAssert1(0,@"Can't build SQL to delete block [%s]", sqlite3_errmsg(database));
	}
	
	sqlite3_bind_int(delStmt, 1, ablock.bgid);
	sqlite3_bind_int(delStmt, 2, ablock.bnumber);
	
	
	if ((sqlite3_step(delStmt)) == SQLITE_DONE)
	{
		NSLog(@"block by id deleted!");
	}
	else 
	{
		NSLog(@"players by id not deleted for some reason!");
	}
	
	
	sqlite3_reset(delStmt); 
	delStmt = nil;
	
}


/*******************************************************************************************************************/

-(void) updateBlock:(block *)ablock
{
	
	[self deleteBlock:ablock];
	
	int ret; // return code
	const char *sql = "insert into blocks (bgameID, bnumber, bplayerID, bpname) values (?, ?, ?, ?);";
	
	if (!updStmt)
	{ // first insert - build statement
		if ((ret=sqlite3_prepare_v2(database, sql, -1, &updStmt, NULL))!=SQLITE_OK)
		{
			NSAssert1(0, @"Error building statement to insert blocks [%s]", sqlite3_errmsg(database));
		}
	}
	
	// bind values
	
	sqlite3_bind_int(updStmt, 1, ablock.bgid);
	sqlite3_bind_int(updStmt, 2, ablock.bnumber);
	sqlite3_bind_int(updStmt, 3, ablock.bpid);
	sqlite3_bind_text(updStmt, 4, [ablock.playerName UTF8String], -1, SQLITE_TRANSIENT);

	// now execute sql statement
	if ((ret=sqlite3_step(updStmt)) != SQLITE_DONE)
	{
		NSAssert1(0, @"Error inserting player [%s]", sqlite3_errmsg(database));
	}
	
	// now reset bound statement to original state
	sqlite3_reset(updStmt);
	updStmt = nil;
	// return [self getMaxPlayerID];
}
/*******************************************************************************************************************/




-(void) attachBlocksToGames
{
	[allBlocks removeAllObjects];
	
	for (game *g in allGames) 
	{
		[g.blocks removeAllObjects];
	}
	
	[self readBlocks];
	
	// attach plyers to games
	for (game *g2 in allGames) 
	{
		for (block *b in allBlocks)
		{
			if (b.bgid == g2.gid) 
			{	
				[g2.blocks addObject:b];
				
				for(player *p in g2.players)
				{
						if(b.bpid == p.pid)
						{
							[p incrementBlockCount];
							break;
						}
				}
			}
		}
	}	
}


/*******************************************************************************************************************/




-(void) attachPlayerToGames
{
	[allPlayers removeAllObjects];
	
	for (game *g in allGames) 
	{
		[g.players removeAllObjects];
	}
	
	[self readPlayers];
	
	// attach plyers to games
	for (game *g2 in allGames) 
	{
		for (player *p in allPlayers)
		{
			if (p.pgid == g2.gid) 
			{	
				[g2.players addObject:p];
			}
		}
	}	
}

/*******************************************************************************************************************/





#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[dbname release];
	[dbpath release];
	[allGames release];
	[allPlayers release];
	[allBlocks release];
	
    [viewController release];
    [window release];
    [super dealloc];
}


@end
