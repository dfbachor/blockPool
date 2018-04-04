//
//  bp2ipadViewController.m
//  bp2ipad
//
//  Created by David Bachor on 3/6/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import "bp2ipadViewController.h"

@implementation bp2ipadViewController

@synthesize gamesPicker;
@synthesize appDeligate;
@synthesize gameNameLabel;
@synthesize xTeamTextBox;
@synthesize yTeamTextBox;
@synthesize wagerTextBox;
@synthesize dateButton;
@synthesize datePicker;
@synthesize currentgid;
@synthesize currentGamePickerRow;
@synthesize playersTable;
@synthesize currentPlayerNameTextBox;
@synthesize currentGameLocked;
@synthesize currentPlayerPhoneTextBox;
@synthesize newPlayerButton;
@synthesize savePlayerButton;
@synthesize currentPlayerid;
@synthesize currentPlayerName;
@synthesize alert;
@synthesize playersLabel;
@synthesize playersNameLabel;
@synthesize lockedLabel;
@synthesize newGameButton;
@synthesize deleteGameButton;
@synthesize saveGameButton;
@synthesize playersPhoneLabel;
@synthesize xyButtonsArray;
@synthesize randomizeButton;
@synthesize currentGameButton;
@synthesize xTeamLabel;
@synthesize yTeamLabel;
@synthesize infoButton;
@synthesize statusLabel;
@synthesize q1Label, q2Label, q3Label, q4Label;
@synthesize xQ1Score, xQ2Score, xQ3Score, xQ4Score, yQ1Score, yQ2Score, yQ3Score, yQ4Score;
@synthesize xValueLable0, xValueLable1, xValueLable2, xValueLable3, xValueLable4, xValueLable5, xValueLable6, xValueLable7, xValueLable8, xValueLable9;
@synthesize yValueLable0, yValueLable1, yValueLable2, yValueLable3, yValueLable4, yValueLable5, yValueLable6, yValueLable7, yValueLable8, yValueLable9;
@synthesize q1WinnerButton, q2WinnerButton, q3WinnerButton, q4WinnerButton;
@synthesize q1WinningLabel, q2WinningLabel, q3WinningLabel, q4WinningLabel;
@synthesize XYButton00, XYButton01, XYButton02, XYButton03, XYButton04, XYButton05, XYButton06, XYButton07, XYButton08, XYButton09; 
@synthesize XYButton10, XYButton11, XYButton12, XYButton13, XYButton14, XYButton15, XYButton16, XYButton17, XYButton18, XYButton19; 
@synthesize XYButton20, XYButton21, XYButton22, XYButton23, XYButton24, XYButton25, XYButton26, XYButton27, XYButton28, XYButton29; 
@synthesize XYButton30, XYButton31, XYButton32, XYButton33, XYButton34, XYButton35, XYButton36, XYButton37, XYButton38, XYButton39; 
@synthesize XYButton40, XYButton41, XYButton42, XYButton43, XYButton44, XYButton45, XYButton46, XYButton47, XYButton48, XYButton49; 
@synthesize XYButton50, XYButton51, XYButton52, XYButton53, XYButton54, XYButton55, XYButton56, XYButton57, XYButton58, XYButton59; 
@synthesize XYButton60, XYButton61, XYButton62, XYButton63, XYButton64, XYButton65, XYButton66, XYButton67, XYButton68, XYButton69; 
@synthesize XYButton70, XYButton71, XYButton72, XYButton73, XYButton74, XYButton75, XYButton76, XYButton77, XYButton78, XYButton79; 
@synthesize XYButton80, XYButton81, XYButton82, XYButton83, XYButton84, XYButton85, XYButton86, XYButton87, XYButton88, XYButton89; 
@synthesize XYButton90, XYButton91, XYButton92, XYButton93, XYButton94, XYButton95, XYButton96, XYButton97, XYButton98, XYButton99;
@synthesize xyBehindButton;


/*******************************************************************************************************************/
- (void)addTarget:(id)target action:(SEL)action forControlEvents: (UIControlEvents)controlEvents
{
    NSLog(@"I am here");
}

/*******************************************************************************************************************/
-(void) addxyButtonAttributesToArray:(UIButton *)theButton
{
	xyButtonAttributes *xyb = [[xyButtonAttributes alloc] init];
	xyb.button = theButton;
	[xyButtonsArray addObject:xyb];
	[xyb release];
}

/*******************************************************************************************************************/
-(void) clearUIButtons
{
	for( xyButtonAttributes *xyb in xyButtonsArray)
	{
		[xyb.button setTitle:@"" forState:UIControlStateNormal];
		[xyb setAssigned:NO];
		[xyb setPlayerAssigned:0];	
		[xyb.button setBackgroundColor:[UIColor lightGrayColor]];
	}
}
/*******************************************************************************************************************/

-(void) clearXYValueLables
{
    [xValueLable0 setText:@"-"];
    [xValueLable1 setText:@"-"];
    [xValueLable2 setText:@"-"];
    [xValueLable3 setText:@"-"];
    [xValueLable4 setText:@"-"];
    [xValueLable5 setText:@"-"];
    [xValueLable6 setText:@"-"];
    [xValueLable7 setText:@"-"];
    [xValueLable8 setText:@"-"];
    [xValueLable9 setText:@"-"];
    [yValueLable0 setText:@"-"];
    [yValueLable1 setText:@"-"];
    [yValueLable2 setText:@"-"];
    [yValueLable3 setText:@"-"];
    [yValueLable4 setText:@"-"];
    [yValueLable5 setText:@"-"];
    [yValueLable6 setText:@"-"];
    [yValueLable7 setText:@"-"];
    [yValueLable8 setText:@"-"];
    [yValueLable9 setText:@"-"];
}


/*************** Current Game Button *********************************************************************************************/
-(IBAction) currentGameButtonClicked
{
        [statusLabel setText:@"(Select Game from My Games Picker)"];
        [gamesPicker setHidden:NO];
        [self.view bringSubviewToFront:gamesPicker];
       // [self updateStatus];
	
}

-(IBAction) currentPlayersNameEditingDidChange
{
    [savePlayerButton setHidden:NO];
    
}

-(IBAction) newPlayerClicked
{
	[self clearCurrentPlayerFields];
    [self hidePlayerDataEntrySection:NO];
	
	NSIndexPath *indexPath = [playersTable indexPathForSelectedRow];
	if (indexPath != nil)
		[playersTable deselectRowAtIndexPath:indexPath animated:YES];
	
	[currentPlayerNameTextBox becomeFirstResponder];
    [self updateStatus];
	
}

- (void)dealloc {
	[alert release];
	[xyButtonsArray	release];
    [statusLabel release];
    [super dealloc];
}

-(IBAction) determineWinner
{
    NSString *qy1 = yQ1Score.text;
    NSString *qx1 = xQ1Score.text;    
    NSString *qy2 = yQ2Score.text;
    NSString *qx2 = xQ2Score.text;    
    NSString *qy3 = yQ3Score.text;
    NSString *qx3 = xQ3Score.text;    
    NSString *qy4 = yQ4Score.text;
    NSString *qx4 = xQ4Score.text;
    
    if( [qy1 length] > 0 && [qx1 length] > 0)
    {
        [self identifyWinningBlock:1 x:[[qx1 substringFromIndex:[qx1 length] -1] intValue] y:[[qy1 substringFromIndex:[qy1 length] -1] intValue]];
    }
    
    if( [qy2 length] > 0 && [qx2 length] > 0)
    {
        [self identifyWinningBlock:2 x:[[qx2 substringFromIndex:[qx2 length] -1] intValue] y:[[qy2 substringFromIndex:[qy2 length] -1] intValue]];
    }    
    
    
    if( [qy3 length] > 0 && [qx3 length] > 0)
    {
        [self identifyWinningBlock:3 x:[[qx3 substringFromIndex:[qx3 length] -1] intValue] y:[[qy3 substringFromIndex:[qy3 length] -1] intValue]];
    }    
    
    
    if( [qy4 length] > 0 && [qx4 length] > 0)
    {
        [self identifyWinningBlock:4 x:[[qx4 substringFromIndex:[qx4 length] -1] intValue] y:[[qy4 substringFromIndex:[qy4 length] -1] intValue]];
    }
    
    [self hideScoreSection:NO];
    
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

/*************** Score Fields *********************************************************************************************/

-(void) hideScoreSection:(BOOL)yn
{
    if (yn == YES) // just hide them all
    {
        [q1Label setHidden:yn];
        [xQ1Score setHidden:yn];
        [yQ1Score setHidden:yn];
        [q1WinnerButton setHidden:yn];
        [q1WinningLabel setHidden:yn];
        [q2Label setHidden:yn];
        [xQ2Score setHidden:yn];
        [yQ2Score setHidden:yn];
        [q2WinnerButton setHidden:yn];
        [q2WinningLabel setHidden:yn];
        [q3Label setHidden:yn];
        [xQ3Score setHidden:yn];
        [yQ3Score setHidden:yn];
        [q3WinnerButton setHidden:yn];
        [q3WinningLabel setHidden:yn];
        [q4Label setHidden:yn];
        [xQ4Score setHidden:yn];
        [yQ4Score setHidden:yn];
        [q4WinnerButton setHidden:yn];
        [q4WinningLabel setHidden:yn];
    }
    
    if( yn == NO) // meaning display the fields but display them logically
    {
        
        [q1Label setHidden:yn];
        [xQ1Score setHidden:yn];
        [yQ1Score setHidden:yn];
        
        
        if( [yQ1Score.text length] > 0 && [xQ1Score.text length] > 0) // meaning there is a score in the q1 fields
        {
            
            [q1WinnerButton setHidden:yn];
            [q1WinningLabel setHidden:yn];
            
            [q2Label setHidden:yn];
            [xQ2Score setHidden:yn];
            [yQ2Score setHidden:yn];

        }
        else
        {
            [q1WinnerButton setHidden:YES];
            [q1WinningLabel setHidden:YES];
            
            [q2Label setHidden:YES];
            [xQ2Score setHidden:YES];
            [yQ2Score setHidden:YES];
            [q2WinnerButton setHidden:YES];
            [q2WinningLabel setHidden:YES];
            [q2WinnerButton setTitle:@"" forState:UIControlStateNormal];

        }
        
        if( [yQ2Score.text length] > 0 && [xQ2Score.text length] > 0) // meaning there is a score in the q1 fields
        {
            [q2WinnerButton setHidden:yn];
            [q2WinningLabel setHidden:yn];  
            
            [q3Label setHidden:yn];
            [xQ3Score setHidden:yn];
            [yQ3Score setHidden:yn];

        }
        else
        {
            [q2WinnerButton setHidden:YES];
            [q2WinningLabel setHidden:YES]; 
            
            [q3Label setHidden:YES];
            [xQ3Score setHidden:YES];
            [yQ3Score setHidden:YES];
            [q3WinnerButton setHidden:YES];
            [q3WinningLabel setHidden:YES];
            [q3WinnerButton setTitle:@"" forState:UIControlStateNormal];

        }
        
        if( [yQ3Score.text length] > 0 && [xQ3Score.text length] > 0) // meaning there is a score in the q1 fields
        {
            [q3WinnerButton setHidden:yn];
            [q3WinningLabel setHidden:yn];
            
            [q4Label setHidden:yn];
            [xQ4Score setHidden:yn];
            [yQ4Score setHidden:yn];
            
        }
        else
        {
            [q3WinnerButton setHidden:YES];
            [q3WinningLabel setHidden:YES];
            
            [q4Label setHidden:YES];
            [xQ4Score setHidden:YES];
            [yQ4Score setHidden:YES];
            [q4WinnerButton setHidden:YES];
            [q4WinningLabel setHidden:YES];
            [q4WinnerButton setTitle:@"" forState:UIControlStateNormal];

        }
        
        if( [yQ4Score.text length] > 0 && [xQ4Score.text length] > 0)
        {
            [q4WinnerButton setHidden:yn];
            [q4WinningLabel setHidden:yn];
        }
        else
        {
            [q4WinnerButton setHidden:YES];
            [q4WinningLabel setHidden:YES];
        }
    }
}



/*******************************************************************************************************************/
-(void) lockCurrentGame
{
	
	
}

- (void)didDismissModalView {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    
}

-(IBAction) infoButtonClicked
{
    
    Info *infoController = [[Info alloc] initWithNibName:@"Info" bundle:nil];
    infoController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:infoController];
    
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;

    [self presentModalViewController:navigationController animated:YES];
    
    
    [navigationController release];
    [infoController release];
    
}


/*************** PLAYERS TABLE VIEW *********************************************************************************************/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return 1;
}


/*******************************************************************************************************************/

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	int pcount=0;
	
	if((currentgid != NOCURRENTGAME) && ([appDeligate.allGames count] != 0))
	{
		game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
		pcount = [g.players count];
	}
	return pcount;
}
/*******************************************************************************************************************/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{
	    
    if( currentGameLocked == GAMELOCKED)
	{	
		UIAlertView *noPlayerAlert = [[[UIAlertView alloc] initWithTitle:@"Event Locked!" 
																 message:@"This game event is locked, Players cannot be deleted!" 
																delegate:nil 
													   cancelButtonTitle:@"OK" 
													   otherButtonTitles:nil] autorelease];
		noPlayerAlert.tag = ALERTVIEWGAMELOCKED;
		[noPlayerAlert show];
		return;
	}

    
    
    [playersTable selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    self.alert = [[[UIAlertView alloc] initWithTitle:@"Delete PLayer?" 
											 message:@"Do you really want to delete this player?" 
											delegate:self 
								   cancelButtonTitle:@"Cancel" 
								   otherButtonTitles:nil] autorelease];
	self.alert.tag = ALERTVIEWDELETEPLAYER;
    [self.alert addButtonWithTitle:@"Yes"];
    [self.alert show];

    NSLog(@"accessory button clicked at index path %d", indexPath.row);
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
	player *p = (player *) [g.players objectAtIndex:indexPath.row];
	currentPlayerNameTextBox.text = p.pname;
	currentPlayerPhoneTextBox.text = p.pphone;
	[self setCurrentPlayerid:p.pid];
	[self setCurrentPlayerName:[NSString stringWithFormat:@"%@", p.pname]];
	[self setBlockColorByUser];

    [playersTable selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

    
}


/*******************************************************************************************************************/
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

	game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
	player *p = (player *) [g.players objectAtIndex:indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:15.0];
	cell.detailTextLabel.font = [UIFont fontWithName:@"Chalkduster" size:12.0];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", p.pname, p.pphone];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%d blocks", [p getBlockCount]];

    return cell;
}
/************ PLayers list ******************************************************************************************************/
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	[self resignAllResponders];
	game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
	player *p = (player *) [g.players objectAtIndex:indexPath.row];
	currentPlayerNameTextBox.text = p.pname;
    
    [currentPlayerNameTextBox setHidden:NO];
    [currentPlayerPhoneTextBox setHidden:NO];
    [playersNameLabel setHidden:NO];
	[playersPhoneLabel setHidden:NO];
    
	currentPlayerPhoneTextBox.text = p.pphone;
	[self setCurrentPlayerid:p.pid];
	[self setCurrentPlayerName:[NSString stringWithFormat:@"%@", p.pname]];
	[self setBlockColorByUser];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 
                                             target:self 
                                           selector:@selector(showWinnersTimer) 
                                           userInfo:nil 
                                            repeats:NO];
    [self updateStatus];
}

-(void) showWinnersTimer
{
    [self QnbuttonTouched];
    timer=nil;
}

-(void) setBlockColorByUser
{
	for( xyButtonAttributes *xyb in xyButtonsArray )
	{
		if(xyb.playerAssigned == currentPlayerid)
		{
			[xyb.button setBackgroundColor:[UIColor blueColor]];
			[xyb.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		}
		else 
		{
			[xyb.button setBackgroundColor:[UIColor lightGrayColor]];
			[xyb.button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
		}
	}	
}


/*******************************************************************************************************************/
-(void) timesUp
{
	xTeamTextBox.backgroundColor = [UIColor lightGrayColor];	
	yTeamTextBox.backgroundColor = [UIColor lightGrayColor];	
	timer=nil;
}
/*******************************************************************************************************************/

-(IBAction) saveGameButtonClicked
{
	NSLog(@"saveGameButtonClicked - current gid = %d", currentgid);
	

	
	if([self.xTeamTextBox.text length] <= 0)
	{	
		timer = [NSTimer scheduledTimerWithTimeInterval:1.0 
												 target:self 
											   selector:@selector(timesUp) 
											   userInfo:nil 
												repeats:NO];
		xTeamTextBox.backgroundColor = [UIColor redColor];
		return; //get out - no value for x team
	}
	
	if([self.yTeamTextBox.text length] <= 0)
	{	
		timer = [NSTimer scheduledTimerWithTimeInterval:1.0 
												 target:self 
											   selector:@selector(timesUp) 
											   userInfo:nil 
												repeats:NO];
		yTeamTextBox.backgroundColor = [UIColor redColor];
		return; //get out - no value for y team
	}
	
	
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMaximumFractionDigits:2];
	NSNumber *nwager = [numberFormatter numberFromString:wagerTextBox.text];
	
	if (currentgid <0) // NEW GAME
	{
		NSLog(@" saving game lable: %@", gameNameLabel.text);
		
		game *newGame = [[game alloc] initWithGame:(NSInteger)nil
											 gName:(NSString *)gameNameLabel.text
											 xTeam:(NSString *)xTeamTextBox.text
											 yTeam:(NSString *)yTeamTextBox.text
											 gdate:(NSString *)dateButton.titleLabel.text
											 wager:nwager
											locked:GAMENOTLOCKED
												x0:(NSInteger)[xValueLable0.text intValue]
												x1:(NSInteger)[xValueLable1.text intValue]
												x2:(NSInteger)[xValueLable2.text intValue]
												x3:(NSInteger)[xValueLable3.text intValue]
												x4:(NSInteger)[xValueLable4.text intValue]
												x5:(NSInteger)[xValueLable5.text intValue]
												x6:(NSInteger)[xValueLable6.text intValue]
												x7:(NSInteger)[xValueLable7.text intValue]
												x8:(NSInteger)[xValueLable8.text intValue]
												x9:(NSInteger)[xValueLable9.text intValue]
												y0:(NSInteger)[yValueLable0.text intValue]
												y1:(NSInteger)[yValueLable1.text intValue]
												y2:(NSInteger)[yValueLable2.text intValue]
												y3:(NSInteger)[yValueLable3.text intValue]
												y4:(NSInteger)[yValueLable4.text intValue]
												y5:(NSInteger)[yValueLable5.text intValue]
												y6:(NSInteger)[yValueLable6.text intValue]
												y7:(NSInteger)[yValueLable7.text intValue]
												y8:(NSInteger)[yValueLable8.text intValue]
												y9:(NSInteger)[yValueLable9.text intValue]
											   xq1:(NSString *)xQ1Score.text
											   xq2:(NSString *)xQ2Score.text
											   xq3:(NSString *)xQ3Score.text
											   xq4:(NSString *)xQ4Score.text
											   yq1:(NSString *)yQ1Score.text
											   yq2:(NSString *)yQ2Score.text
											   yq3:(NSString *)yQ3Score.text
											   yq4:(NSString *)yQ4Score.text
										  gplayers:(NSMutableArray *)nil
										   gblocks:(NSMutableArray *)nil];
		[appDeligate saveGame:newGame];
		[newGame release];	
		[self setCurrentgid:[appDeligate getMaxGameID]];
		[self setCurrentGameLocked:GAMENOTLOCKED];
		[appDeligate readGames];	
		[gamesPicker reloadAllComponents];
		[gamesPicker selectRow:([appDeligate.allGames count]-1) inComponent:0 animated:YES];
		//[self setCurrentGame:currentgid];
		[self setCurrentGamePickerRow:[appDeligate.allGames count]-1];
		[playersTable reloadData];
		[self clearCurrentPlayerFields];
        
		
	}
	else // UPDATE GAme
	{
		
		game *currentGame = [[game alloc] initWithGame:(NSInteger)currentgid
												 gName:(NSString *)gameNameLabel.text
												 xTeam:(NSString *)xTeamTextBox.text
												 yTeam:(NSString *)yTeamTextBox.text
												 gdate:(NSString *)dateButton.titleLabel.text
												 wager:nwager
												locked:currentGameLocked
													x0:(NSInteger)[xValueLable0.text intValue]
													x1:(NSInteger)[xValueLable1.text intValue]
													x2:(NSInteger)[xValueLable2.text intValue]
													x3:(NSInteger)[xValueLable3.text intValue]
													x4:(NSInteger)[xValueLable4.text intValue]
													x5:(NSInteger)[xValueLable5.text intValue]
													x6:(NSInteger)[xValueLable6.text intValue]
													x7:(NSInteger)[xValueLable7.text intValue]
													x8:(NSInteger)[xValueLable8.text intValue]
													x9:(NSInteger)[xValueLable9.text intValue]
													y0:(NSInteger)[yValueLable0.text intValue]
													y1:(NSInteger)[yValueLable1.text intValue]
													y2:(NSInteger)[yValueLable2.text intValue]
													y3:(NSInteger)[yValueLable3.text intValue]
													y4:(NSInteger)[yValueLable4.text intValue]
													y5:(NSInteger)[yValueLable5.text intValue]
													y6:(NSInteger)[yValueLable6.text intValue]
													y7:(NSInteger)[yValueLable7.text intValue]
													y8:(NSInteger)[yValueLable8.text intValue]
													y9:(NSInteger)[yValueLable9.text intValue]	
                                                   xq1:(NSString *)xQ1Score.text
                                                   xq2:(NSString *)xQ2Score.text
                                                   xq3:(NSString *)xQ3Score.text
                                                   xq4:(NSString *)xQ4Score.text
                                                   yq1:(NSString *)yQ1Score.text
                                                   yq2:(NSString *)yQ2Score.text
                                                   yq3:(NSString *)yQ3Score.text
                                                   yq4:(NSString *)yQ4Score.text
											  gplayers:(NSMutableArray *)nil
											   gblocks:(NSMutableArray *)nil];
		[appDeligate updateGame:currentGame];
		[currentGame release];		
		[appDeligate readGames];		
		[gamesPicker reloadAllComponents];
	}
	
	if(currentGameLocked == GAMENOTLOCKED)
		[self hidePlayerSection:NO];
	
	if(currentGameLocked == GAMELOCKED)
		[self hidePlayerDataEntrySection:YES];
		
	[playersTable reloadData];
    [deleteGameButton setHidden:NO];
    //[self updateStatus];

}


-(void) clearGame
{
	self.gameNameLabel.text = @"";
	self.xTeamTextBox.text = @"";
	self.yTeamTextBox.text = @"";
	NSString *swager = @"1";
	self.wagerTextBox.text = swager;
	[self setCurrentPlayerid:NOCURRENTPLAYER];
	[self setCurrentPlayerName:nil];
	[self setCurrentGameLocked:GAMENOTLOCKED];
	[self.lockedLabel setHidden:YES];
	[self.randomizeButton setHidden:YES];
	[self hideScoreSection:YES];
	
	[xQ1Score setText:@""];
	[xQ2Score setText:@""];
	[xQ3Score setText:@""];
	[xQ4Score setText:@""];
	[yQ1Score setText:@""];
	[yQ2Score setText:@""];
	[yQ3Score setText:@""];
	[yQ4Score setText:@""];

	[self setDatePickerDateToToday];
	[self clearUIButtons];
    [self clearXYValueLables];
    [deleteGameButton setHidden:YES];
	// [self.currentGameButton setTitle:@"" forState:UIControlStateNormal];
    [self updateStatus];
}




/*******************************************************************************************************************/

-(IBAction) catName
{
    if(gamesPicker.hidden == NO) // this means that the use has selected my games when in new game mode
        return;
    
	self.gameNameLabel.text = [NSString stringWithFormat:@"%@ vs. %@", xTeamTextBox.text, yTeamTextBox.text];
	[self.xTeamLabel setHidden:NO];
	[self.yTeamLabel setHidden:NO];
	[self.xTeamLabel setText:xTeamTextBox.text];
	[self.yTeamLabel setText:yTeamTextBox.text];
	//[self.currentGameButton setTitle:gameNameLabel.text forState:UIControlStateNormal];	
    [self updateStatus];

}

-(IBAction) QnbuttonTouched
{
    
    [self resignAllResponders];
    
    // UIButton *qnButton = (UIButton *)sender;
    // NSString *qnButtonText = qnButton.titleLabel.text;
    // NSString *qnButtonText = q1WinnerButton.titleLabel.text;
    
    int x;
    int y;
    
    if (q1WinnerButton.hidden == NO)
    {
        x = [[q1WinnerButton.titleLabel.text substringWithRange:NSMakeRange(0, 1)] intValue]; // left most value
        y = [[q1WinnerButton.titleLabel.text substringFromIndex:[q1WinnerButton.titleLabel.text length] -1] intValue]; //rightmost value
        [self highlightWinningBlock:x y:y color:[UIColor redColor]];
        [q1WinnerButton setBackgroundColor:[UIColor redColor]];
        [q1WinningLabel setBackgroundColor:[UIColor redColor]];
    }

    if (q2WinnerButton.hidden == NO)
    {    
        x = [[q2WinnerButton.titleLabel.text substringWithRange:NSMakeRange(0, 1)] intValue]; // left most value
        y = [[q2WinnerButton.titleLabel.text substringFromIndex:[q2WinnerButton.titleLabel.text length] -1] intValue]; //rightmost value
        [self highlightWinningBlock:x y:y color:[UIColor orangeColor]];
        [q2WinnerButton setBackgroundColor:[UIColor orangeColor]];
        [q2WinningLabel setBackgroundColor:[UIColor orangeColor]];

    }
    
    
    if (q3WinnerButton.hidden == NO)
    {
        x = [[q3WinnerButton.titleLabel.text substringWithRange:NSMakeRange(0, 1)] intValue]; // left most value
        y = [[q3WinnerButton.titleLabel.text substringFromIndex:[q3WinnerButton.titleLabel.text length] -1] intValue]; //rightmost value
        [self highlightWinningBlock:x y:y color:[UIColor cyanColor]];  
        [q3WinnerButton setBackgroundColor:[UIColor cyanColor]];
        [q3WinningLabel setBackgroundColor:[UIColor cyanColor]];

    }    
    
    if (q4WinnerButton.hidden == NO)
    {   
        x = [[q4WinnerButton.titleLabel.text substringWithRange:NSMakeRange(0, 1)] intValue]; // left most value
        y = [[q4WinnerButton.titleLabel.text substringFromIndex:[q4WinnerButton.titleLabel.text length] -1] intValue]; //rightmost value
        [self highlightWinningBlock:x y:y color:[UIColor yellowColor]]; 
        [q4WinnerButton setBackgroundColor:[UIColor yellowColor]];
        [q4WinningLabel setBackgroundColor:[UIColor yellowColor]];

    }
    
}

-(void) highlightWinningBlock:(int)x y:(int)y color:(UIColor *)theColor
{
    game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
    int blockx;
    int blocky;
    
    if(x == g.x0) blockx = 0;
    else if (x == g.x1) blockx = 1;
    else if (x == g.x2) blockx = 2;
    else if (x == g.x3) blockx = 3;
    else if (x == g.x4) blockx = 4;
    else if (x == g.x5) blockx = 5;
    else if (x == g.x6) blockx = 6;
    else if (x == g.x7) blockx = 7;
    else if (x == g.x8) blockx = 8;
    else if (x == g.x9) blockx = 9;
    
    if(y == g.y0) blocky = 0;
    else if (y == g.y1) blocky = 1;
    else if (y == g.y2) blocky = 2;
    else if (y == g.y3) blocky = 3;
    else if (y == g.y4) blocky = 4;
    else if (y == g.y5) blocky = 5;
    else if (y == g.y6) blocky = 6;
    else if (y == g.y7) blocky = 7;
    else if (y == g.y8) blocky = 8;
    else if (y == g.y9) blocky = 9;
    
    
    NSLog(@"winning block x-%d, y-%d, blockx-%d, blocky-%d", x, y, blockx, blocky);
    NSString *catTheBlock = [NSString stringWithFormat:@"%d%d", blockx, blocky];
    int theBlockNumber = [catTheBlock intValue];
    
    for( xyButtonAttributes *xyb in xyButtonsArray )
    {
        if(xyb.button.tag == theBlockNumber)
        {
            NSLog(@"theblocknum is %d, playername %@", theBlockNumber, xyb.playerName);
            //[q1WinningLabel setText:xyb.playerName];
            
            
            xyb.button.backgroundColor = theColor;
            [xyb.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
            break;
        }
    }

}


-(void) identifyWinningBlock:(int)q x:(int)x y:(int)y
{
    
    game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
    int blockx;
    int blocky;
    
    if(x == g.x0) blockx = 0;
    else if (x == g.x1) blockx = 1;
    else if (x == g.x2) blockx = 2;
    else if (x == g.x3) blockx = 3;
    else if (x == g.x4) blockx = 4;
    else if (x == g.x5) blockx = 5;
    else if (x == g.x6) blockx = 6;
    else if (x == g.x7) blockx = 7;
    else if (x == g.x8) blockx = 8;
    else if (x == g.x9) blockx = 9;
    
    if(y == g.y0) blocky = 0;
    else if (y == g.y1) blocky = 1;
    else if (y == g.y2) blocky = 2;
    else if (y == g.y3) blocky = 3;
    else if (y == g.y4) blocky = 4;
    else if (y == g.y5) blocky = 5;
    else if (y == g.y6) blocky = 6;
    else if (y == g.y7) blocky = 7;
    else if (y == g.y8) blocky = 8;
    else if (y == g.y9) blocky = 9;
    
    
    NSLog(@"winning block q-%d x-%d, y-%d, blockx-%d, blocky-%d", q, x, y, blockx, blocky);
    NSString *catTheBlock = [NSString stringWithFormat:@"%d%d", blockx, blocky];
    int theBlockNumber = [catTheBlock intValue];
    float theWager = [wagerTextBox.text floatValue];


    switch (q) 
    {
        case 1:
        {
            [q1WinnerButton setTitle:[NSString stringWithFormat:@"%d, %d", x, y] forState:UIControlStateNormal];
            
            for( xyButtonAttributes *xyb in xyButtonsArray )
            {
                if(xyb.button.tag == theBlockNumber)
                {
                    NSLog(@"theblocknum is %d, playername %@", theBlockNumber, xyb.playerName);
                    
                    // [q1WinningLabel setText:xyb.playerName];
                    [q1WinningLabel setText:[NSString stringWithFormat:@"%.2f %@", (theWager * 25), xyb.playerName]];
                    break;
                }
            }

            break;  
        }
        case 2:
        {
            NSLog(@"winning block q-%d x-%d, y-%d", q, x, y);
            [q2WinnerButton setTitle:[NSString stringWithFormat:@"%d, %d", x, y] forState:UIControlStateNormal];
                        
            for( xyButtonAttributes *xyb in xyButtonsArray )
            {
                if(xyb.button.tag == theBlockNumber)
                {
                    NSLog(@"theblocknum is %d, playername %@", theBlockNumber, xyb.playerName);
                    //[q2WinningLabel setText:xyb.playerName];
                    [q2WinningLabel setText:[NSString stringWithFormat:@"%.2f %@", (theWager * 25), xyb.playerName]];
                    break;
                }
            }
            break;    
        }
        case 3:
        {
            NSLog(@"winning block q-%d x-%d, y-%d", q, x, y);
            [q3WinnerButton setTitle:[NSString stringWithFormat:@"%d, %d", x, y] forState:UIControlStateNormal];
            
            for( xyButtonAttributes *xyb in xyButtonsArray )
            {
                if(xyb.button.tag == theBlockNumber)
                {
                    NSLog(@"theblocknum is %d, playername %@", theBlockNumber, xyb.playerName);
                    //[q3WinningLabel setText:xyb.playerName];
                    [q3WinningLabel setText:[NSString stringWithFormat:@"%.2f %@", (theWager * 25), xyb.playerName]];
                    break;
                }
            }
    
            break;   
        }
        case 4:
        {
            NSLog(@"winning block q-%d x-%d, y-%d", q, x, y);
            [q4WinnerButton setTitle:[NSString stringWithFormat:@"%d, %d", x, y] forState:UIControlStateNormal];
                        
            for( xyButtonAttributes *xyb in xyButtonsArray )
            {
                if(xyb.button.tag == theBlockNumber)
                {
                    NSLog(@"theblocknum is %d, playername %@", theBlockNumber, xyb.playerName);
                    // [q4WinningLabel setText:xyb.playerName];
                    [q4WinningLabel setText:[NSString stringWithFormat:@"%.2f %@", (theWager * 25), xyb.playerName]];
                    break;
                }
            }
            
            break;
        }
        default:
            break;
    }
}


/*******************************************************************************************************************/
-(void) hidePlayerDataEntrySection:(BOOL)yn
{
	[currentPlayerNameTextBox setHidden:yn];
	[currentPlayerPhoneTextBox setHidden:yn];
    [savePlayerButton setHidden:yn];
	[playersNameLabel setHidden:yn];
	[playersPhoneLabel setHidden:yn];
}

-(void)hidePlayerSection:(BOOL)yn
{
	[playersTable setHidden:yn];
    if(currentGameLocked == GAMELOCKED )
    { 
        [newPlayerButton setHidden:YES];
    }
    else
    {
        [newPlayerButton setHidden:yn];       
    }
	[playersLabel setHidden:yn];
	//[self hidePlayerDataEntrySection:yn];
}
/*******************************************************************************************************************/
-(IBAction) goAwayKeyboard:(id)sender
{
	[sender resignFirstResponder]; // this makes the kepboard go away
}
/*******************************************************************************************************************/

-(IBAction) tapBackground:(id) sender
{
    
    //UITouch *touch = [[ev allTouches] anyObject];
    //CGPoint touchPoint = [touch locationInView:self.view];

    
    
	//[gameNameLabel resignFirstResponder]; // this makes the kepboard go away
	[self resignAllResponders];
	[self clearCurrentPlayerFields];
    [self hidePlayerDataEntrySection:YES];
    [self updateStatus];
}

/*******************************************************************************************************************/

-(IBAction) newGameButtonClicked
{
    [self resignAllResponders];
	[self setCurrentgid:NOCURRENTGAME];
	[self setCurrentGameLocked:GAMENOTLOCKED];
	
	[self setCurrentGame:currentgid];
	[self.xTeamLabel setText:@""];
	[self.yTeamLabel setText:@""];
	self.gameNameLabel.text = @"Enter Teams!";
	// [self.currentGameButton setHidden:YES];
    
	[playersTable reloadData];
	[self hidePlayerSection:YES];
	[self hidePlayerDataEntrySection:YES];
    [deleteGameButton setHidden:YES];
    [xTeamTextBox becomeFirstResponder];
    [self updateStatus];

}

/********************* GAME PICKER **********************************************************************************************/


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (void)pickerView:(UIPickerView *)pickerView 
	  didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component
{
	game *g = (game *)[appDeligate.allGames objectAtIndex:row];
	
	//[currentGameButton setTitle:g.gname forState:UIControlStateNormal];
	[self setCurrentgid:g.gid];
	[self setCurrentGameLocked:g.locked];
    [self setCurrentGamePickerRow:row];
    [self setCurrentGame:g.gid];
	[playersTable reloadData];
    [playersTable setHidden:NO];
	[self clearCurrentPlayerFields];
	[gamesPicker setHidden:YES];
	
	NSLog(@"picker value selected! %@", g.gname);
    [self updateStatus];
}

- (UIView *)pickerView:(UIPickerView *)pickerView
			viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component
		   reusingView:(UIView *)view 

{
	UILabel *pickerLabel = (UILabel *)view;
	
	if (pickerLabel == nil) {
		CGRect frame = CGRectMake(0.0, 0.0, 400, 15);
		pickerLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		[pickerLabel setTextAlignment:UITextAlignmentCenter];
		[pickerLabel setBackgroundColor:[UIColor clearColor]];
		[pickerLabel setFont:[UIFont fontWithName:@"Chalkduster" size:15.0]];
	}
	game *g = (game *)[appDeligate.allGames objectAtIndex:row];
	
	[pickerLabel setText:g.gname];
	
	return pickerLabel;
	
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
		int gcount = [appDeligate.allGames count];
		return gcount;
}
/*  this method will set the picker row to default font - replacing with the above "viewForRow"
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{	
	game *g = (game *)[appDeligate.allGames objectAtIndex:row];

	return g.gname;
}
 */

/*******************************************************************************************************************/

-(void) clearCurrentPlayerFields
{
	currentPlayerNameTextBox.text = @"";
	//currentPlayerInitialsTextBox.text = @"";
	currentPlayerPhoneTextBox.text = @"";
	[self setCurrentPlayerid:NOCURRENTPLAYER];
	[self setCurrentPlayerName:nil];
	[self setBlockColorByUser];
	
	NSIndexPath *indexPath = [playersTable indexPathForSelectedRow];
	if (indexPath != nil)
		[playersTable deselectRowAtIndexPath:indexPath animated:YES];
	
}

/*******************************************************************************************************************/
-(IBAction) dateButtonClicked
{
	[xTeamTextBox resignFirstResponder];
	[yTeamTextBox resignFirstResponder];
	[wagerTextBox resignFirstResponder];
    [statusLabel setText:@"(Select Date from the date Picker)"];

	
	datePicker.hidden = NO;
	[self.view bringSubviewToFront:datePicker];
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = kCFDateFormatterLongStyle;
	[dateButton setTitle:[df stringFromDate:[datePicker date]] forState:UIControlStateNormal]; 
	[df release];
	[self saveGameButtonClicked];
}
/*******************************************************************************************************************/

-(IBAction) datePickerChanged
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = kCFDateFormatterLongStyle;
	[dateButton setTitle:[df stringFromDate:[datePicker date]] forState:UIControlStateNormal]; 
	[df release];
	//[datePicker setHidden:YES];
	[self saveGameButtonClicked];

}
/*******************************************************************************************************************/

-(void) setDatePickerDateToToday
{
	datePicker.date = [NSDate date];
}

/*******************************************************************************************************************/
-(void)resignAllResponders
{
	[xQ1Score resignFirstResponder];
	[xQ2Score resignFirstResponder];
	[xQ3Score resignFirstResponder];
	[xQ4Score resignFirstResponder];
	[yQ1Score resignFirstResponder];
	[yQ2Score resignFirstResponder];
	[yQ3Score resignFirstResponder];
	[yQ4Score resignFirstResponder];
    
    [xTeamTextBox resignFirstResponder];
	[yTeamTextBox resignFirstResponder];
	[wagerTextBox resignFirstResponder];
	[dateButton resignFirstResponder];
	[currentPlayerNameTextBox resignFirstResponder];
	[currentPlayerPhoneTextBox resignFirstResponder];
	
	[datePicker setHidden:YES];
	[gamesPicker setHidden:YES];
    [self updateStatus];
}


/*******************************************************************************************************************/
-(IBAction) savePlayerClicked
{
	
	NSLog(@"savePlayerClicked currentgid = %d : currentPLayerID = %d", currentgid, currentPlayerid);
    [currentPlayerNameTextBox resignFirstResponder];
    [currentPlayerPhoneTextBox resignFirstResponder];
    [self hidePlayerDataEntrySection:YES];

	if (currentPlayerid == NOCURRENTPLAYER) // new player
	{
		player *aPlayer = [[player alloc] initWithPlayer:(NSInteger)nil
													pgid:currentgid
												   pname:(NSString *)currentPlayerNameTextBox.text
												  pphone:(NSString *)currentPlayerPhoneTextBox.text
											   pinitials:nil];
								   
		aPlayer.pid = [appDeligate saveNewPlayer:aPlayer];
		
		[appDeligate.allPlayers addObject:aPlayer];
		game *g = (game *) [appDeligate.allGames objectAtIndex:currentGamePickerRow];
		[g.players addObject:aPlayer];		
        [self setCurrentPlayerid:aPlayer.pid];
        [self setCurrentPlayerName:currentPlayerNameTextBox.text];

		[aPlayer release];
		[playersTable reloadData];
        
        //[playersTable reloadData];
        NSIndexPath *ip=[NSIndexPath indexPathForRow:([g.players count]-1) inSection:0];
        [playersTable selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionBottom];
        
        return;
	}
	else // edit player 
	{
		NSIndexPath *ip = [playersTable indexPathForSelectedRow];
        
        player *aPlayer = [[player alloc] initWithPlayer:currentPlayerid
													pgid:currentgid
												   pname:(NSString *)currentPlayerNameTextBox.text
												  pphone:(NSString *)currentPlayerPhoneTextBox.text
											   pinitials:nil];
		
		[appDeligate updatePlayer:aPlayer];
		
		
		// update all players - may not be needed but oh well
		for (player *p in appDeligate.allPlayers)
		{
			if( p.pid == currentPlayerid)
			{
				p.pname = aPlayer.pname;
				p.pphone = aPlayer.pphone;
				p.pinitials = aPlayer.pinitials;
				break;
			}
		}
		
		// update player in game
		for (game *g in appDeligate.allGames)
		{
			if (g.gid == currentgid) 
			{
				for (player *p in g.players)
				{
					if( p.pid == currentPlayerid)
					{
						p.pname = aPlayer.pname;
						p.pphone = aPlayer.pphone;
						p.pinitials = aPlayer.pinitials;
                        [self setCurrentPlayerid:aPlayer.pid];
                        [self setCurrentPlayerName:aPlayer.pname];
						break;
					}
				}
            
                // this is update the player name had it changed
                for(block *gb in g.blocks) // loop all of them
                {
                    if( gb.bpid == currentPlayerid)
                    {
                        gb.playerName = aPlayer.pname;
                    }
                }
                
                [self setupUIButtonsForGame:g];
                
				break;
			}
		}
		
		[aPlayer release];
		[playersTable reloadData];
        
        [playersTable selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionBottom];
        [self setBlockColorByUser];
        
	}
	// [self clearCurrentPlayerFields];
	// [self setCurrentPlayerid:NOCURRENTPLAYER];
	// [self setCurrentPlayerName:nil];
    [savePlayerButton setHidden:YES];
    [self updateStatus];
    

}
/*******************************************************************************************************************/

-(void) deleteGameClicked
{
	self.alert = [[[UIAlertView alloc] initWithTitle:@"Delete Game?" 
												   message:@"Do you really want to delete this game?" 
												  delegate:self 
										 cancelButtonTitle:@"Cancel" 
										 otherButtonTitles:nil] autorelease];
	self.alert.tag = ALERTVIEWDELETEGAME;
    [self.alert addButtonWithTitle:@"Yes"];
    [self.alert show];
	
}
/*******************************************************************************************************************/

/*
-(IBAction) deletePlayerClicked
{
	if( currentPlayerid == NOCURRENTPLAYER)
	{	
		UIAlertView *noPlayerAlert = [[[UIAlertView alloc] initWithTitle:@"No player selected!" 
																 message:@"There is not a players selected!" 
																delegate:nil 
													   cancelButtonTitle:@"OK" 
													   otherButtonTitles:nil] autorelease];
		noPlayerAlert.tag = ALERTVIEWNOCURRENTUSER;
		[noPlayerAlert show];
		return;
	}
	
	self.alert = [[[UIAlertView alloc] initWithTitle:@"Delete PLayer?" 
											 message:@"Do you really want to delete this player?" 
											delegate:self 
								   cancelButtonTitle:@"Cancel" 
								   otherButtonTitles:nil] autorelease];
	self.alert.tag = ALERTVIEWDELETEPLAYER;
    [self.alert addButtonWithTitle:@"Yes"];
    [self.alert show];
	//[alert release];  this causes issues when releasing this object
		
}
*/
/*******************************************************************************************************************/

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	
	NSLog(@"alertView - actionSheet.tag: %d", actionSheet.tag);
	if(actionSheet.tag == ALERTVIEWDELETEPLAYER)
	{
		if (buttonIndex == 1) // Yes
		{
			NSLog(@"ok to delete the player");
		
			[appDeligate deletePlayerByID:currentPlayerid]; // this also delete the blocks for this player in this game only
		
			// delete from all players - may not be needed but oh well
			for (player *p in appDeligate.allPlayers)
			{
				if( p.pid == currentPlayerid)
				{
					[appDeligate.allPlayers removeObject:p];
					break;
				}
			}
		
			// delete player in game
			for (game *g in appDeligate.allGames)
			{
				if (g.gid == currentgid) 
				{
					for (player *p in g.players)
					{
						if( p.pid == currentPlayerid)
						{
							[g.players removeObject:p];
								break;
						}
					}
                    
                    // remove the block that belong to the deleted player
                    NSMutableArray *blocksToBeDeleted = [[NSMutableArray alloc] init]; // arrayto hold the identified blocks to be removed
                    
                    for (block *b in g.blocks)
                    {
                        NSLog(@"current player id : %d - block id : %d - count : %d", currentPlayerid, b.bpid, [g.blocks count]);
                        
                        if( b.bpid == currentPlayerid)
                        {
                            //[g.blocks removeObject:b];
                            [blocksToBeDeleted addObject:b]; // add the block to the deleted list array
                        }
                    }
                    
                    [g.blocks removeObjectsInArray:blocksToBeDeleted]; // delete the block that need to be deleted
                    [blocksToBeDeleted release];
                    [self setupUIButtonsForGame:g];
					break;
				}
			}
            
			[self clearCurrentPlayerFields];
            [playersTable setEditing:NO];
			[playersTable reloadData];
		}
		else
		{
			NSLog(@"cancel deleting the player");
		}
	} //end actionSheet.tag == ALERTVIEWDELETEPLAYER)	
	
	if(actionSheet.tag == ALERTVIEWDELETEGAME) //delete Game
	{
		if (buttonIndex == 1) // Yes
		{
			NSLog(@"ok to delete the gamegame id %d", currentgid );
            if(currentgid != NOCURRENTGAME)
            {
                //[gamesPicker selectRow:(0) inComponent:0 animated:YES];
                [appDeligate deleteGame:currentgid];
                [appDeligate readGames];
                [gamesPicker reloadAllComponents];
                [gamesPicker selectRow:([appDeligate.allGames count]-1) inComponent:0 animated:YES];
                [self setCurrentGamePickerRow:[appDeligate.allGames count]-1];
                [playersTable reloadData];
                [self clearCurrentPlayerFields];
            }
			
			//[self setCurrentGame:NOCURRENTGAME];
			//[self hidePlayerSection:NO];
			[self setViewAsIfStartingNewInstance];
		}
		else
		{
			NSLog(@"cancel deleting the player");
		}
	} //end actionSheet.tag == ALERTVIEWDELETEGAME)	
	
	if (actionSheet.tag == ALERTVIEWRANDOMIZEE)
	{
		if (buttonIndex == 1) // Yes
		{
			[self randomizeXYValues];
			
		}
		else 
		{
			NSLog(@"cancel randomize");
		}
	}
}
/*******************************************************************************************************************/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation 
{
		
	if((self.interfaceOrientation == UIDeviceOrientationLandscapeLeft) || (self.interfaceOrientation == UIDeviceOrientationLandscapeRight))
	{
		
	} 
	else	if((self.interfaceOrientation == UIDeviceOrientationPortrait) || (self.interfaceOrientation == UIDeviceOrientationPortraitUpsideDown))
	{

	}
}

/*************** Manage Buttons  *********************************************************************************************/

-(IBAction) randomizeButtonClicked
{
	self.alert = [[[UIAlertView alloc] initWithTitle:@"Ramdomize?" 
											 message:@"Are you sure you want to set the row and column values - this will lock block selections?" 
											delegate:self 
								   cancelButtonTitle:@"Cancel" 
								   otherButtonTitles:nil] autorelease];
	self.alert.tag = ALERTVIEWRANDOMIZEE;
    [self.alert addButtonWithTitle:@"Yes"];
    [self.alert show];
    
	
}
-(void) randomizeXYValues
{
	
	NSMutableArray *rvalues = [[NSMutableArray alloc] init];
	int icount =0;
	
	while ([rvalues count] < 10 || icount > 100) // icount to keep from infinate loop - highest value seen was 56 so far
	{
		icount++;
		if([rvalues count] == 0) // this is the first random number in the list so take it and move on
		{
			[rvalues addObject:[NSNumber numberWithInt:(arc4random() % 10)]];
		}
		else 
		{
			int r = arc4random() % 10;
			BOOL dupe = NO;
			
			for (NSNumber *n in rvalues)
			{
				if( r == [n intValue]) 
				{
					dupe = YES;
					break;
				}
			}
            
			if ( dupe == NO) // no match so assign it
                [rvalues addObject:[NSNumber numberWithInt:r]];
		}
	} // end while
    
	[xValueLable0 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:0] intValue]]];
	[xValueLable1 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:1] intValue]]];
	[xValueLable2 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:2] intValue]]];
	[xValueLable3 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:3] intValue]]];
	[xValueLable4 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:4] intValue]]];
	[xValueLable5 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:5] intValue]]];
	[xValueLable6 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:6] intValue]]];
	[xValueLable7 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:7] intValue]]];
	[xValueLable8 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:8] intValue]]];
	[xValueLable9 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:9] intValue]]];
	
	icount=0;
	[rvalues removeAllObjects];
	
	while ([rvalues count] < 10 || icount > 100) // icount to keep from infinate loop - highest value seen was 56 so far
	{
		icount++;
		if([rvalues count] == 0) // this is the first random number in the list so take it and move on
		{
			[rvalues addObject:[NSNumber numberWithInt:(arc4random() % 10)]];
		}
		else 
		{
			int r = arc4random() % 10;
			BOOL dupe = NO;
			
			for (NSNumber *n in rvalues)
			{
				if( r == [n intValue]) 
				{
					dupe = YES;
					break;
				}
			}
			
			if ( dupe == NO) // no match so assign it
				[rvalues addObject:[NSNumber numberWithInt:r]];
		}
	} // end while
	
	[yValueLable0 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:0] intValue]]];
	[yValueLable1 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:1] intValue]]];
	[yValueLable2 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:2] intValue]]];
	[yValueLable3 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:3] intValue]]];
	[yValueLable4 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:4] intValue]]];
	[yValueLable5 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:5] intValue]]];
	[yValueLable6 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:6] intValue]]];
	[yValueLable7 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:7] intValue]]];
	[yValueLable8 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:8] intValue]]];
	[yValueLable9 setText:[NSString stringWithFormat:@"%d", [[rvalues objectAtIndex:9] intValue]]];
    
	
	[rvalues release];
	[self setCurrentGameLocked:GAMELOCKED];
	[self.randomizeButton setHidden:YES];
	[self.lockedLabel setText:@"Locked"];
	[self hideScoreSection:NO];
	[self hidePlayerDataEntrySection:YES];
	[self saveGameButtonClicked];
}



/*******************************************************************************************************************/

- (void) setCurrentGame:(NSInteger)theCurrentgid
{
	[self setCurrentgid:theCurrentgid];
	
	if(theCurrentgid <0)
	{
		[self clearGame];
	}
	else
	{		
		for(game *g in appDeligate.allGames)
		{
			if(g.gid == theCurrentgid)
			{
				self.gameNameLabel.text = [NSString stringWithFormat:@"%@", g.gname];
				self.xTeamTextBox.text = [NSString stringWithFormat:@"%@", g.xTeam];	
				self.yTeamTextBox.text = [NSString stringWithFormat:@"%@", g.yTeam];
				self.xTeamLabel.text = [NSString stringWithFormat:@"%@", g.xTeam];
				self.yTeamLabel.text = [NSString stringWithFormat:@"%@", g.yTeam];
				
				
				NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
				[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
				[numberFormatter setMaximumFractionDigits:2];
				NSString *swager = [numberFormatter stringForObjectValue:g.wager];
				self.wagerTextBox.text = swager;
				
				[self.dateButton setTitle:[NSString stringWithFormat:@"%@", g.gdate] forState:UIControlStateNormal];
				
				NSDateFormatter *df = [[NSDateFormatter alloc] init];
				df.dateStyle = kCFDateFormatterLongStyle;
				[datePicker setDate:[ df dateFromString:g.gdate]];
				[df release];
				
				[xValueLable0 setText:[NSString stringWithFormat:@"%d", g.x0]];
				[xValueLable1 setText:[NSString stringWithFormat:@"%d", g.x1]];
				[xValueLable2 setText:[NSString stringWithFormat:@"%d", g.x2]];
				[xValueLable3 setText:[NSString stringWithFormat:@"%d", g.x3]];
				[xValueLable4 setText:[NSString stringWithFormat:@"%d", g.x4]];
				[xValueLable5 setText:[NSString stringWithFormat:@"%d", g.x5]];
				[xValueLable6 setText:[NSString stringWithFormat:@"%d", g.x6]];
				[xValueLable7 setText:[NSString stringWithFormat:@"%d", g.x7]];
				[xValueLable8 setText:[NSString stringWithFormat:@"%d", g.x8]];
				[xValueLable9 setText:[NSString stringWithFormat:@"%d", g.x9]];
				[yValueLable0 setText:[NSString stringWithFormat:@"%d", g.y0]];
				[yValueLable1 setText:[NSString stringWithFormat:@"%d", g.y1]];
				[yValueLable2 setText:[NSString stringWithFormat:@"%d", g.y2]];
				[yValueLable3 setText:[NSString stringWithFormat:@"%d", g.y3]];
				[yValueLable4 setText:[NSString stringWithFormat:@"%d", g.y4]];
				[yValueLable5 setText:[NSString stringWithFormat:@"%d", g.y5]];
				[yValueLable6 setText:[NSString stringWithFormat:@"%d", g.y6]];
				[yValueLable7 setText:[NSString stringWithFormat:@"%d", g.y7]];
				[yValueLable8 setText:[NSString stringWithFormat:@"%d", g.y8]];
				[yValueLable9 setText:[NSString stringWithFormat:@"%d", g.y9]];
				
				[xQ1Score setText:g.xq1];
				[xQ2Score setText:g.xq2];
				[xQ3Score setText:g.xq3];
				[xQ4Score setText:g.xq4];
				[yQ1Score setText:g.yq1];
				[yQ2Score setText:g.yq2];
				[yQ3Score setText:g.yq3];
				[yQ4Score setText:g.yq4];
				
				if(g.locked == GAMELOCKED)
				{
					self.lockedLabel.text = @"Locked";
					[self setCurrentGameLocked:GAMELOCKED];
                    [self setupUIButtonsForGame:g];
                    [self determineWinner];
					[self.randomizeButton setHidden:YES];
					[self hidePlayerDataEntrySection:YES];
					[self hideScoreSection:NO];
                    [newPlayerButton setHidden:YES];
                    
				}
				else 
				{
					self.lockedLabel.text = @"";
					[self setCurrentGameLocked:GAMENOTLOCKED];
                    [self setupUIButtonsForGame:g];
					[self hidePlayerDataEntrySection:YES];
					[self hideScoreSection:YES];
                    [newPlayerButton setHidden:NO];
				}
                
				
				//setup the buttons for this game
                [deleteGameButton setHidden:NO];
				
                
				break;
			}
		}	
	}
}

/*******************************************************************************************************************/


-(IBAction) saveOnEditingDidEnd
{
    // [self resignAllResponder];
	
    NSLog(@"saveOnEditingDidEnd");
	[self saveGameButtonClicked];
	//[self.currentGameButton setHidden:NO];
	//[self.deleteGameButton setHidden:NO];
	[self.newGameButton setHidden:NO];
    
    if([lockedLabel.text  isEqualToString:@"Locked"])
    {
        [self determineWinner];
        [self hideScoreSection:NO]; // if we are here then the fields are displayed - this call will draw the score fields logically based on scores provided
    }
    
}

/*******************************************************************************************************************/

-(void) setViewAsIfStartingNewInstance
{
	bp2ipadAppDelegate *d = (bp2ipadAppDelegate *) [[UIApplication sharedApplication] delegate];
	appDeligate = d;
	
	BOOL noSavedGames = ([appDeligate.allGames count] == 0);
	game *g;
	
	if(noSavedGames)
	{
		[self setCurrentGame:currentgid];
		[self.newGameButton setHidden:YES];
		[self.deleteGameButton setHidden:YES];
		[self.xTeamLabel setHidden:YES];
		[self.yTeamLabel setHidden:YES];
		[self.randomizeButton setHidden:YES];
		// [self.currentGameButton setHidden:YES];
		[self.saveGameButton setHidden:YES];
		
		[self setDatePickerDateToToday];
		[self setCurrentgid:NOCURRENTGAME];
		[self setCurrentGameLocked:GAMENOTLOCKED];
		[self.xTeamTextBox setText:@""];
		[self.yTeamTextBox setText:@""];
		[self.wagerTextBox setText:@"1"];
		self.gameNameLabel.text = @"Enter Teams!";
		self.lockedLabel.text = @"";
		[xQ1Score setText:@""];
		[xQ2Score setText:@""];
		[xQ3Score setText:@""];
		[xQ4Score setText:@""];
		[yQ1Score setText:@""];
		[yQ2Score setText:@""];
		[yQ3Score setText:@""];
		[yQ4Score setText:@""];
		
		NSDateFormatter *df = [[NSDateFormatter alloc] init];
		df.dateStyle = kCFDateFormatterLongStyle;
		[dateButton setTitle:[df stringFromDate:[datePicker date]] forState:UIControlStateNormal]; 
		[df release];
		[self clearUIButtons];
		[self hidePlayerSection:YES];		
		[self hideScoreSection:YES];
	}
	
	if(!noSavedGames)
		g = (game *)[appDeligate.allGames objectAtIndex:0]; // o sets to the first in the array
	
	if(!noSavedGames)
		[self setCurrentgid:g.gid];
    
	if(!noSavedGames)
        [self setCurrentGameLocked:g.locked];
	
	[playersTable setDelegate:self];
	[playersTable setDataSource:self];
	[self setCurrentGamePickerRow:0];
	
	if(!noSavedGames)	
		[playersTable reloadData];
	
	
	[self setCurrentPlayerid:NOCURRENTPLAYER];
	[self setCurrentPlayerName:nil];
	
	if(!noSavedGames)
	{
		//[currentGameButton setTitle:g.gname forState:UIControlStateNormal];
		//[self.currentGameButton setHidden:NO];
	}
	
	if(!noSavedGames)
		[self setCurrentGame:g.gid];
	
}

/*******************************************************************************************************************/
-(void) setupUIButtonsForGame:(game *)theGame
{
	[self clearUIButtons];
	
	for(block *gb in theGame.blocks)
	{
		for(xyButtonAttributes *xyb in xyButtonsArray)
		{
			if( gb.bnumber == [xyb.button tag])
			{
				[xyb.button setTitle:[NSString stringWithFormat:@"%@", gb.playerName] forState:UIControlStateNormal];
                [xyb setPlayerName:gb.playerName];
				[xyb setAssigned:YES];
				[xyb setPlayerAssigned:gb.bpid];
				[xyb.button setBackgroundColor:[UIColor lightGrayColor]];
				[xyb.button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
			}
		}
	}
	
	NSLog(@"setupUIButtonsForGame - game %@, blocks %d", theGame.gname, [theGame.blocks count]);
	
	if([theGame.blocks count] < 100)
	{
		[self.randomizeButton setHidden:YES];
	}
	else
	{
		if(theGame.locked == GAMENOTLOCKED)
			[self.randomizeButton setHidden:NO];
	}
}

-(void) updatePlayerBlockCount // this is just to reload the data after the block count has already been updated
{
	NSIndexPath *indexPath = [playersTable indexPathForSelectedRow];
	[playersTable reloadData];
	[playersTable selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}
/******************************************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[xyBehindButton superview] sendSubviewToBack:xyBehindButton];
	
	[datePicker setHidden:YES];
	[gamesPicker setHidden:YES];
    [self.saveGameButton setHidden:YES];
	
	/* setup the x lable to be vertical */
	self.xTeamLabel.textAlignment = UITextAlignmentCenter;
	//rotate label in 45 degrees
	self.xTeamLabel.transform = CGAffineTransformMakeRotation( -1.58 ); //M_PI/4
    
    [self populateButtonsArray];
	[self setViewAsIfStartingNewInstance];
}

- (void)viewDidUnload {
    [self setStatusLabel:nil];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

/*******************************************************************************************************************/


-(void) selectPlayerInPlayersTable:(int)pid
{
    game *g = (game *)[appDeligate.allGames objectAtIndex:currentGamePickerRow];
    int pindex=0;
    
    for(player *p in g.players)
    {
        if(p.pid == pid)
        {
            NSIndexPath *myPath = [NSIndexPath indexPathForRow:pindex inSection:0];
            [playersTable selectRowAtIndexPath:myPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            
            currentPlayerNameTextBox.text = p.pname;
            
            //[currentPlayerNameTextBox setHidden:NO];
            //[currentPlayerPhoneTextBox setHidden:NO];
            //[playersNameLabel setHidden:NO];
            //[playersPhoneLabel setHidden:NO];
            
            currentPlayerPhoneTextBox.text = p.pphone;
            [self setCurrentPlayerid:p.pid];
            [self setCurrentPlayerName:[NSString stringWithFormat:@"%@", p.pname]];
            [self setBlockColorByUser];
            
            
            break;	
        }
        else
        {
            pindex++;
        }
        
    }
}


/*******************************************************************************************************************/
-(void) gameLockedTimer
{
    lockedLabel.backgroundColor = [UIColor clearColor];
    [self QnbuttonTouched];
    timer=nil;
}

-(IBAction) xyButtonClicked:(id) sender
{
	UIButton *myButton = (UIButton *)sender;
	NSLog(@"xybutton clicked %d", [myButton tag]);
    xyButtonAttributes *xya = [xyButtonsArray objectAtIndex:[myButton tag]]; // this need to be here

	if( currentGameLocked == GAMELOCKED)
	{	
        if(xya.assigned == YES)
        {
            [self selectPlayerInPlayersTable:xya.playerAssigned];
            //return;
        }
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 
												 target:self 
											   selector:@selector(gameLockedTimer) 
											   userInfo:nil 
												repeats:NO];
		lockedLabel.backgroundColor = [UIColor redColor];
        
        
		return; 

        /*
		UIAlertView *noPlayerAlert = [[[UIAlertView alloc] initWithTitle:@"Event Locked!" 
																 message:@"This game event is locked, blocks cannot be adjusted!" 
																delegate:nil 
													   cancelButtonTitle:@"OK" 
													   otherButtonTitles:nil] autorelease];
		noPlayerAlert.tag = ALERTVIEWGAMELOCKED;
		[noPlayerAlert show];
		return;
         */
	}
    
    
    if( currentPlayerid == NOCURRENTPLAYER)
	{	
        if(xya.assigned == YES)
        {
            [self selectPlayerInPlayersTable:xya.playerAssigned];
            return;
        }
    
        else
        {
		
            UIAlertView *noPlayerAlert = [[[UIAlertView alloc] initWithTitle:@"No player selected!" 
                                                                     message:@"There is not a players selected!" 
                                                                    delegate:nil 
                                                           cancelButtonTitle:@"OK" 
                                                           otherButtonTitles:nil] autorelease];
            noPlayerAlert.tag = ALERTVIEWNOCURRENTUSER;
            [noPlayerAlert show];
            return;
        }
	}

    
	// is block assigned & if assigned to current player release it and return
	//     if assigned to another player just return
	
	if(xya.assigned == YES)
	{
		if(xya.playerAssigned == currentPlayerid)
		{
			[xya.button setTitle:@"" forState:UIControlStateNormal];
			[xya setAssigned:NO];
			[xya setPlayerAssigned:0];	
			[xya.button setBackgroundColor:[UIColor lightGrayColor]];
			[xya.button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
			[self.randomizeButton setHidden:YES]; // since we have de-assigned a block there is no way that all are assigned
            
			block *ablock = [[block alloc] initWithBlock:currentgid bnumber:(NSInteger)[myButton tag] bpid:currentPlayerid bpname:currentPlayerName];
			[appDeligate deleteBlock:ablock];
			[ablock release];
			
			// remove from game.blocks
			for(game *g in appDeligate.allGames)
			{
				if (g.gid == currentgid) 
				{
					int bindex = 0;
					for( block *b in g.blocks )
					{
						if(b.bpid == currentPlayerid && b.bnumber == [myButton tag])
						{
							[g.blocks removeObjectAtIndex:bindex];
							
							for(player *p in g.players)
							{
								if(p.pid == currentPlayerid)
								{
									[p decrementBlockCount];
									break;	
								}
							}
							break;
						}
						bindex++;
					}
					break;
				}
			}
            
			[self updatePlayerBlockCount];
            
			// remove from allblocks
			int bindex = 0;
			for( block *b in appDeligate.allBlocks )
			{
				if(b.bpid == currentPlayerid && b.bnumber == [myButton tag] && b.bgid == currentgid)
				{
					[appDeligate.allBlocks removeObjectAtIndex:bindex];
					break;
				}
				bindex++;
			}
			////return;
		}
		//return; // no reason to go on - the block is already assigned to another user
	} else 
    {
	
	// if block not assigned
	//		update block as assigned in blockbutton array
	//		update player id
	//		change color to reflect assigned
	
        // [xya.button setTitle:[NSString stringWithFormat:@"%d", currentPlayerid] forState:UIControlStateNormal];
        [xya.button setTitle:[NSString stringWithFormat:@"%@", currentPlayerName] forState:UIControlStateNormal];
	
        [xya setAssigned:YES];
        [xya setPlayerAssigned:currentPlayerid];
        [xya setPlayerName:[NSString stringWithFormat:@"%@", currentPlayerName]];
        [xya.button setBackgroundColor:[UIColor blueColor]];
        [xya.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
        block *ablock = [[block alloc] initWithBlock:currentgid bnumber:(NSInteger)[myButton tag] bpid:currentPlayerid bpname:currentPlayerName];
        [appDeligate updateBlock:ablock]; // database add
	
        for(game *g in appDeligate.allGames)
        {
            if (g.gid == currentgid) 
            {
                [g.blocks addObject:ablock]; // game block array add
			
                for(player *p in g.players)
                {
                    if(p.pid == currentPlayerid)
                    {
                        [p incrementBlockCount];
                        break;	
                    }
				
                }
			
			
                if([g.blocks count] < 100)
                    [self.randomizeButton setHidden:YES];
                else
                    [self.randomizeButton setHidden:NO];
			
                break;
            }
        }
        [appDeligate.allBlocks addObject:ablock];
        [ablock release];
        [self updatePlayerBlockCount];
    }
    
    [self updateStatus];
}

-(void) updateStatus
{
    NSMutableString *status = [[NSMutableString alloc] initWithString:@""];
    if ([self.xTeamTextBox.text length] <= 0)
        [status appendString:@" (X Team Name Incomplete)"];
    
    if([self.yTeamTextBox.text length] <= 0)
        [status appendString:@" (Y Team Name Incomplete)"];
    
    if (self.randomizeButton.hidden == NO)
        [status appendString:@" (Select Generate Block Numbers from the menu bar)"];

    for (game *g in appDeligate.allGames)
    {
        if (g.gid == currentgid) 
        {
            if([g.blocks count] < 100)      
            {
                
                [status appendString:[NSString stringWithFormat:@" (%d block(s) vacant, add player and select blocks)", (100-[g.blocks count])]];
            } else // all locks selected
            {
            
            }
            
        }
    }
        
        [statusLabel setText:status];
}



-(void) populateButtonsArray
{
	xyButtonsArray = [[NSMutableArray alloc] init];
		
	[self addxyButtonAttributesToArray:XYButton00];
	[self addxyButtonAttributesToArray:XYButton01];
	[self addxyButtonAttributesToArray:XYButton02];
	[self addxyButtonAttributesToArray:XYButton03];
	[self addxyButtonAttributesToArray:XYButton04];
	[self addxyButtonAttributesToArray:XYButton05];
	[self addxyButtonAttributesToArray:XYButton06];
	[self addxyButtonAttributesToArray:XYButton07];
	[self addxyButtonAttributesToArray:XYButton08];
	[self addxyButtonAttributesToArray:XYButton09];
	[self addxyButtonAttributesToArray:XYButton10];
	[self addxyButtonAttributesToArray:XYButton11];
	[self addxyButtonAttributesToArray:XYButton12];
	[self addxyButtonAttributesToArray:XYButton13];
	[self addxyButtonAttributesToArray:XYButton14];
	[self addxyButtonAttributesToArray:XYButton15];
	[self addxyButtonAttributesToArray:XYButton16];
	[self addxyButtonAttributesToArray:XYButton17];
	[self addxyButtonAttributesToArray:XYButton18];
	[self addxyButtonAttributesToArray:XYButton19];
	[self addxyButtonAttributesToArray:XYButton20];
	[self addxyButtonAttributesToArray:XYButton21];
	[self addxyButtonAttributesToArray:XYButton22];
	[self addxyButtonAttributesToArray:XYButton23];
	[self addxyButtonAttributesToArray:XYButton24];
	[self addxyButtonAttributesToArray:XYButton25];
	[self addxyButtonAttributesToArray:XYButton26];
	[self addxyButtonAttributesToArray:XYButton27];
	[self addxyButtonAttributesToArray:XYButton28];
	[self addxyButtonAttributesToArray:XYButton29];
	[self addxyButtonAttributesToArray:XYButton30];
	[self addxyButtonAttributesToArray:XYButton31];
	[self addxyButtonAttributesToArray:XYButton32];
	[self addxyButtonAttributesToArray:XYButton33];
	[self addxyButtonAttributesToArray:XYButton34];
	[self addxyButtonAttributesToArray:XYButton35];
	[self addxyButtonAttributesToArray:XYButton36];
	[self addxyButtonAttributesToArray:XYButton37];
	[self addxyButtonAttributesToArray:XYButton38];
	[self addxyButtonAttributesToArray:XYButton39];
	[self addxyButtonAttributesToArray:XYButton40];
	[self addxyButtonAttributesToArray:XYButton41];
	[self addxyButtonAttributesToArray:XYButton42];
	[self addxyButtonAttributesToArray:XYButton43];
	[self addxyButtonAttributesToArray:XYButton44];
	[self addxyButtonAttributesToArray:XYButton45];
	[self addxyButtonAttributesToArray:XYButton46];
	[self addxyButtonAttributesToArray:XYButton47];
	[self addxyButtonAttributesToArray:XYButton48];
	[self addxyButtonAttributesToArray:XYButton49];
	[self addxyButtonAttributesToArray:XYButton50];
	[self addxyButtonAttributesToArray:XYButton51];
	[self addxyButtonAttributesToArray:XYButton52];
	[self addxyButtonAttributesToArray:XYButton53];
	[self addxyButtonAttributesToArray:XYButton54];
	[self addxyButtonAttributesToArray:XYButton55];
	[self addxyButtonAttributesToArray:XYButton56];
	[self addxyButtonAttributesToArray:XYButton57];
	[self addxyButtonAttributesToArray:XYButton58];
	[self addxyButtonAttributesToArray:XYButton59];
	[self addxyButtonAttributesToArray:XYButton60];
	[self addxyButtonAttributesToArray:XYButton61];
	[self addxyButtonAttributesToArray:XYButton62];
	[self addxyButtonAttributesToArray:XYButton63];
	[self addxyButtonAttributesToArray:XYButton64];
	[self addxyButtonAttributesToArray:XYButton65];
	[self addxyButtonAttributesToArray:XYButton66];
	[self addxyButtonAttributesToArray:XYButton67];
	[self addxyButtonAttributesToArray:XYButton68];
	[self addxyButtonAttributesToArray:XYButton69];
	[self addxyButtonAttributesToArray:XYButton70];
	[self addxyButtonAttributesToArray:XYButton71];
	[self addxyButtonAttributesToArray:XYButton72];
	[self addxyButtonAttributesToArray:XYButton73];
	[self addxyButtonAttributesToArray:XYButton74];
	[self addxyButtonAttributesToArray:XYButton75];
	[self addxyButtonAttributesToArray:XYButton76];
	[self addxyButtonAttributesToArray:XYButton77];
	[self addxyButtonAttributesToArray:XYButton78];
	[self addxyButtonAttributesToArray:XYButton79];
	[self addxyButtonAttributesToArray:XYButton80];
	[self addxyButtonAttributesToArray:XYButton81];
	[self addxyButtonAttributesToArray:XYButton82];
	[self addxyButtonAttributesToArray:XYButton83];
	[self addxyButtonAttributesToArray:XYButton84];
	[self addxyButtonAttributesToArray:XYButton85];
	[self addxyButtonAttributesToArray:XYButton86];
	[self addxyButtonAttributesToArray:XYButton87];
	[self addxyButtonAttributesToArray:XYButton88];
	[self addxyButtonAttributesToArray:XYButton89];
	[self addxyButtonAttributesToArray:XYButton90];
	[self addxyButtonAttributesToArray:XYButton91];
	[self addxyButtonAttributesToArray:XYButton92];
	[self addxyButtonAttributesToArray:XYButton93];
	[self addxyButtonAttributesToArray:XYButton94];
	[self addxyButtonAttributesToArray:XYButton95];
	[self addxyButtonAttributesToArray:XYButton96];
	[self addxyButtonAttributesToArray:XYButton97];
	[self addxyButtonAttributesToArray:XYButton98];
	[self addxyButtonAttributesToArray:XYButton99];
	
}
@end
