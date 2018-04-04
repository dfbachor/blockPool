//
//  bp2ipadViewController.h
//  bp2ipad
//
//  Created by David Bachor on 3/6/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bp2ipadAppDelegate.h"
#import	"xyButtonAttributes.h"
#import "Info.h"

#define NOCURRENTPLAYER -1
#define NOCURRENTGAME -2

#define ALERTVIEWDELETEPLAYER 100
#define	ALERTVIEWDELETEGAME 101
#define ALERTVIEWNOCURRENTUSER 102
#define ALERTVIEWRANDOMIZEE 103
#define ALERTVIEWGAMELOCKED 104

#define GAMELOCKED 1
#define GAMENOTLOCKED 0

@interface bp2ipadViewController : UIViewController <UIPickerViewDelegate, 
													UIPickerViewDataSource, 
													UITableViewDelegate,		
													UITableViewDataSource,
													UIAlertViewDelegate,
                                                    ModalViewControllerDelegate>
{

	bp2ipadAppDelegate *appDeligate;
	UIPickerView *gamesPicker;
	UIButton *currentGameButton;
	UIButton *newGameButton;
	UIButton *deleteGameButton;
		
	UILabel *playersLabel;
	UILabel *playersNameLabel;
	UILabel *playersPhoneLabel;
	UILabel *xTeamLabel;
	UILabel *yTeamLabel;

	UILabel *gameNameLabel;
	UITextField *xTeamTextBox;
	UITextField *yTeamTextBox;
	UITextField *wagerTextBox;
	
	UITextField *currentPlayerNameTextBox;
	UITextField *currentPlayerPhoneTextBox;

	NSInteger currentgid;
	NSInteger currentGamePickerRow;
	NSInteger currentPlayerid;
	NSString *currentPlayerName;
	NSInteger currentGameLocked;


	UIButton *saveGameButton;	
	UIButton *dateButton;
	UIDatePicker *datePicker;
	NSTimer *timer;
	
	UITableView *playersTable;
	UIButton *newPlayerButton;
	//UIButton *deletePlayerButton;
	UIButton *savePlayerButton;
	
	UIButton *randomizeButton;
	
	UILabel *lockedLabel;
	
	UILabel *q1Label;
	UILabel *q2Label;
	UILabel *q3Label;
	UILabel *q4Label;
	
	UITextField *xQ1Score;
	UITextField *xQ2Score;
	UITextField *xQ3Score;
	UITextField *xQ4Score;
	UITextField *yQ1Score;
	UITextField *yQ2Score;
	UITextField *yQ3Score;
	UITextField *yQ4Score;
	
	UILabel *xValueLable0;
	UILabel *xValueLable1;
	UILabel *xValueLable2;
	UILabel *xValueLable3;
	UILabel *xValueLable4;
	UILabel *xValueLable5;
	UILabel *xValueLable6;
	UILabel *xValueLable7;
	UILabel *xValueLable8;
	UILabel *xValueLable9;
	
	UILabel *yValueLable0;
	UILabel *yValueLable1;
	UILabel *yValueLable2;
	UILabel *yValueLable3;
	UILabel *yValueLable4;
	UILabel *yValueLable5;
	UILabel *yValueLable6;
	UILabel *yValueLable7;
	UILabel *yValueLable8;
	UILabel *yValueLable9;
    
    UIButton *q1WinnerButton;
    UIButton *q2WinnerButton;
    UIButton *q3WinnerButton;
    UIButton *q4WinnerButton;
    
    UILabel *q1WinningLabel;
    UILabel *q2WinningLabel;
    UILabel *q3WinningLabel;
    UILabel *q4WinningLabel;
	
	UIAlertView *alert;
	
	NSMutableArray *xyButtonsArray;
	
	UIButton *XYButton00;
	UIButton *XYButton01;
	UIButton *XYButton02;
	UIButton *XYButton03;
	UIButton *XYButton04;
	UIButton *XYButton05;
	UIButton *XYButton06;
	UIButton *XYButton07;
	UIButton *XYButton08;
	UIButton *XYButton09;
	UIButton *XYButton10;
	UIButton *XYButton11;
	UIButton *XYButton12;
	UIButton *XYButton13;
	UIButton *XYButton14;
	UIButton *XYButton15;
	UIButton *XYButton16;
	UIButton *XYButton17;
	UIButton *XYButton18;
	UIButton *XYButton19;
	UIButton *XYButton20;
	UIButton *XYButton21;
	UIButton *XYButton22;
	UIButton *XYButton23;
	UIButton *XYButton24;
	UIButton *XYButton25;
	UIButton *XYButton26;
	UIButton *XYButton27;
	UIButton *XYButton28;
	UIButton *XYButton29;
	UIButton *XYButton30;
	UIButton *XYButton31;
	UIButton *XYButton32;
	UIButton *XYButton33;
	UIButton *XYButton34;
	UIButton *XYButton35;
	UIButton *XYButton36;
	UIButton *XYButton37;
	UIButton *XYButton38;
	UIButton *XYButton39;
	UIButton *XYButton40;
	UIButton *XYButton41;
	UIButton *XYButton42;
	UIButton *XYButton43;
	UIButton *XYButton44;
	UIButton *XYButton45;
	UIButton *XYButton46;
	UIButton *XYButton47;
	UIButton *XYButton48;
	UIButton *XYButton49;
	UIButton *XYButton50;
	UIButton *XYButton51;
	UIButton *XYButton52;
	UIButton *XYButton53;
	UIButton *XYButton54;
	UIButton *XYButton55;
	UIButton *XYButton56;
	UIButton *XYButton57;
	UIButton *XYButton58;
	UIButton *XYButton59;
	UIButton *XYButton60;
	UIButton *XYButton61;
	UIButton *XYButton62;
	UIButton *XYButton63;
	UIButton *XYButton64;
	UIButton *XYButton65;
	UIButton *XYButton66;
	UIButton *XYButton67;
	UIButton *XYButton68;
	UIButton *XYButton69;
	UIButton *XYButton70;
	UIButton *XYButton71;
	UIButton *XYButton72;
	UIButton *XYButton73;
	UIButton *XYButton74;
	UIButton *XYButton75;
	UIButton *XYButton76;
	UIButton *XYButton77;
	UIButton *XYButton78;
	UIButton *XYButton79;
	UIButton *XYButton80;
	UIButton *XYButton81;
	UIButton *XYButton82;
	UIButton *XYButton83;
	UIButton *XYButton84;
	UIButton *XYButton85;
	UIButton *XYButton86;
	UIButton *XYButton87;
	UIButton *XYButton88;
	UIButton *XYButton89;
	UIButton *XYButton90;
	UIButton *XYButton91;
	UIButton *XYButton92;
	UIButton *XYButton93;
	UIButton *XYButton94;
	UIButton *XYButton95;
	UIButton *XYButton96;
	UIButton *XYButton97;
	UIButton *XYButton98;
	UIButton *XYButton99;
    
    UIButton *xyBehindButton;
    UIButton *infoButton;
    

}

@property (nonatomic, readwrite) NSInteger currentgid;
@property (nonatomic, readwrite) NSInteger currentGamePickerRow;
@property (nonatomic, readwrite) NSInteger currentPlayerid;
@property (nonatomic, retain) NSString *currentPlayerName;
@property (nonatomic, retain) IBOutlet UILabel *playersLabel;
@property (nonatomic, retain) IBOutlet UILabel *playersNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *playersPhoneLabel;
@property (nonatomic, retain) IBOutlet UILabel *xTeamLabel;
@property (nonatomic, retain) IBOutlet UILabel *yTeamLabel;
@property (nonatomic, retain) IBOutlet UIButton *newGameButton;
@property (nonatomic, retain) IBOutlet UIButton *deleteGameButton;
@property (nonatomic, retain) IBOutlet UIButton *saveGameButton;
@property (nonatomic, retain) IBOutlet UILabel *lockedLabel;
@property (nonatomic, readwrite) NSInteger currentGameLocked;    
@property (nonatomic, retain) IBOutlet UIButton *q1WinnerButton;
@property (nonatomic, retain) IBOutlet UIButton *q2WinnerButton;
@property (nonatomic, retain) IBOutlet UIButton *q3WinnerButton;
@property (nonatomic, retain) IBOutlet UIButton *q4WinnerButton;
@property (nonatomic, retain) IBOutlet UILabel *q1WinningLabel;
@property (nonatomic, retain) IBOutlet UILabel *q2WinningLabel;
@property (nonatomic, retain) IBOutlet UILabel *q3WinningLabel;
@property (nonatomic, retain) IBOutlet UILabel *q4WinningLabel;
@property (nonatomic, retain) IBOutlet UIButton *xyBehindButton;
@property (nonatomic, retain) IBOutlet UIButton *infoButton;
@property (retain, nonatomic) IBOutlet UILabel *statusLabel;


-(IBAction) catName;
-(IBAction) datePickerChanged;
-(IBAction) dateButtonClicked;
-(IBAction) infoButtonClicked;
-(void) setDatePickerDateToToday;
-(IBAction) tapBackground:(id) sender;
-(IBAction) goAwayKeyboard:(id)sender;
-(void) clearGame;
-(IBAction) newGameButtonClicked;
-(IBAction) saveGameButtonClicked;
-(void) setCurrentGame:(NSInteger)theCurrentgid;
-(void) clearCurrentPlayerFields;
-(IBAction) savePlayerClicked;
//-(IBAction) deletePlayerClicked;
-(IBAction) newPlayerClicked;
-(IBAction) deleteGameClicked;
-(IBAction) xyButtonClicked:(id) sender;
-(void) populateButtonsArray;
-(void) addxyButtonAttributesToArray:(UIButton *)theButton;
-(void) clearUIButtons;
-(void) hidePlayerSection:(BOOL)yn;
-(void) setBlockColorByUser;
-(IBAction) randomizeButtonClicked;
-(void) randomizeXYValues;
-(IBAction) currentGameButtonClicked;
-(IBAction) saveOnEditingDidEnd;
-(void) setViewAsIfStartingNewInstance;
-(void) resignAllResponders;
-(void) hidePlayerDataEntrySection:(BOOL)yn;
-(void) updatePlayerBlockCount;
-(void) hideScoreSection:(BOOL)yn;
-(void) clearXYValueLables;
-(IBAction) determineWinner;
-(IBAction) currentPlayersNameEditingDidChange;
-(void) identifyWinningBlock:(int)q x:(int)x y:(int)y;
-(IBAction) QnbuttonTouched;
-(void) setupUIButtonsForGame:(game *)theGame;
-(void) selectPlayerInPlayersTable:(int)pid;
-(void) gameLockedTimer;
-(void) highlightWinningBlock:(int)x y:(int)y color:(UIColor *)theColor;
-(void) showWinnersTimer;
-(void) updateStatus;



@property (nonatomic, retain) bp2ipadAppDelegate *appDeligate;
@property (nonatomic, retain) IBOutlet UIPickerView *gamesPicker;
@property (nonatomic, retain) IBOutlet UILabel *gameNameLabel;
@property (nonatomic, retain) IBOutlet UITextField *xTeamTextBox;
@property (nonatomic, retain) IBOutlet UITextField *yTeamTextBox;
@property (nonatomic, retain) IBOutlet UITextField *wagerTextBox;
@property (nonatomic, retain) IBOutlet UIButton *dateButton;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UITableView *playersTable;
@property (nonatomic, retain) IBOutlet UITextField *currentPlayerNameTextBox;
@property (nonatomic, retain) IBOutlet UITextField *currentPlayerPhoneTextBox;
@property (nonatomic, retain) IBOutlet UIButton *newPlayerButton;
//@property (nonatomic, retain) IBOutlet UIButton *deletePlayerButton;
@property (nonatomic, retain) IBOutlet UIButton *savePlayerButton;
@property (nonatomic, retain) UIAlertView *alert;
@property (nonatomic, retain) NSMutableArray *xyButtonsArray;
@property (nonatomic, retain) IBOutlet UIButton *randomizeButton;
@property (nonatomic, retain) IBOutlet UIButton *currentGameButton;

@property (nonatomic, retain) IBOutlet UILabel *q1Label;
@property (nonatomic, retain) IBOutlet UILabel *q2Label;
@property (nonatomic, retain) IBOutlet UILabel *q3Label;
@property (nonatomic, retain) IBOutlet UILabel *q4Label;

@property (nonatomic, retain) IBOutlet UITextField *xQ1Score;
@property (nonatomic, retain) IBOutlet UITextField *xQ2Score;
@property (nonatomic, retain) IBOutlet UITextField *xQ3Score;
@property (nonatomic, retain) IBOutlet UITextField *xQ4Score;
@property (nonatomic, retain) IBOutlet UITextField *yQ1Score;
@property (nonatomic, retain) IBOutlet UITextField *yQ2Score;
@property (nonatomic, retain) IBOutlet UITextField *yQ3Score;
@property (nonatomic, retain) IBOutlet UITextField *yQ4Score;

@property (nonatomic, retain) IBOutlet UILabel *xValueLable0;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable1;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable2;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable3;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable4;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable5;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable6;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable7;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable8;
@property (nonatomic, retain) IBOutlet UILabel *xValueLable9;

@property (nonatomic, retain) IBOutlet UILabel *yValueLable0;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable1;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable2;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable3;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable4;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable5;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable6;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable7;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable8;
@property (nonatomic, retain) IBOutlet UILabel *yValueLable9;

@property (nonatomic, retain) IBOutlet UIButton *XYButton00;
@property (nonatomic, retain) IBOutlet UIButton *XYButton01;
@property (nonatomic, retain) IBOutlet UIButton *XYButton02;
@property (nonatomic, retain) IBOutlet UIButton *XYButton03;
@property (nonatomic, retain) IBOutlet UIButton *XYButton04;
@property (nonatomic, retain) IBOutlet UIButton *XYButton05;
@property (nonatomic, retain) IBOutlet UIButton *XYButton06;
@property (nonatomic, retain) IBOutlet UIButton *XYButton07;
@property (nonatomic, retain) IBOutlet UIButton *XYButton08;
@property (nonatomic, retain) IBOutlet UIButton *XYButton09;
@property (nonatomic, retain) IBOutlet UIButton *XYButton10;
@property (nonatomic, retain) IBOutlet UIButton *XYButton11;
@property (nonatomic, retain) IBOutlet UIButton *XYButton12;
@property (nonatomic, retain) IBOutlet UIButton *XYButton13;
@property (nonatomic, retain) IBOutlet UIButton *XYButton14;
@property (nonatomic, retain) IBOutlet UIButton *XYButton15;
@property (nonatomic, retain) IBOutlet UIButton *XYButton16;
@property (nonatomic, retain) IBOutlet UIButton *XYButton17;
@property (nonatomic, retain) IBOutlet UIButton *XYButton18;
@property (nonatomic, retain) IBOutlet UIButton *XYButton19;
@property (nonatomic, retain) IBOutlet UIButton *XYButton20;
@property (nonatomic, retain) IBOutlet UIButton *XYButton21;
@property (nonatomic, retain) IBOutlet UIButton *XYButton22;
@property (nonatomic, retain) IBOutlet UIButton *XYButton23;
@property (nonatomic, retain) IBOutlet UIButton *XYButton24;
@property (nonatomic, retain) IBOutlet UIButton *XYButton25;
@property (nonatomic, retain) IBOutlet UIButton *XYButton26;
@property (nonatomic, retain) IBOutlet UIButton *XYButton27;
@property (nonatomic, retain) IBOutlet UIButton *XYButton28;
@property (nonatomic, retain) IBOutlet UIButton *XYButton29;
@property (nonatomic, retain) IBOutlet UIButton *XYButton30;
@property (nonatomic, retain) IBOutlet UIButton *XYButton31;
@property (nonatomic, retain) IBOutlet UIButton *XYButton32;
@property (nonatomic, retain) IBOutlet UIButton *XYButton33;
@property (nonatomic, retain) IBOutlet UIButton *XYButton34;
@property (nonatomic, retain) IBOutlet UIButton *XYButton35;
@property (nonatomic, retain) IBOutlet UIButton *XYButton36;
@property (nonatomic, retain) IBOutlet UIButton *XYButton37;
@property (nonatomic, retain) IBOutlet UIButton *XYButton38;
@property (nonatomic, retain) IBOutlet UIButton *XYButton39;
@property (nonatomic, retain) IBOutlet UIButton *XYButton40;
@property (nonatomic, retain) IBOutlet UIButton *XYButton41;
@property (nonatomic, retain) IBOutlet UIButton *XYButton42;
@property (nonatomic, retain) IBOutlet UIButton *XYButton43;
@property (nonatomic, retain) IBOutlet UIButton *XYButton44;
@property (nonatomic, retain) IBOutlet UIButton *XYButton45;
@property (nonatomic, retain) IBOutlet UIButton *XYButton46;
@property (nonatomic, retain) IBOutlet UIButton *XYButton47;
@property (nonatomic, retain) IBOutlet UIButton *XYButton48;
@property (nonatomic, retain) IBOutlet UIButton *XYButton49;
@property (nonatomic, retain) IBOutlet UIButton *XYButton50;
@property (nonatomic, retain) IBOutlet UIButton *XYButton51;
@property (nonatomic, retain) IBOutlet UIButton *XYButton52;
@property (nonatomic, retain) IBOutlet UIButton *XYButton53;
@property (nonatomic, retain) IBOutlet UIButton *XYButton54;
@property (nonatomic, retain) IBOutlet UIButton *XYButton55;
@property (nonatomic, retain) IBOutlet UIButton *XYButton56;
@property (nonatomic, retain) IBOutlet UIButton *XYButton57;
@property (nonatomic, retain) IBOutlet UIButton *XYButton58;
@property (nonatomic, retain) IBOutlet UIButton *XYButton59;
@property (nonatomic, retain) IBOutlet UIButton *XYButton60;
@property (nonatomic, retain) IBOutlet UIButton *XYButton61;
@property (nonatomic, retain) IBOutlet UIButton *XYButton62;
@property (nonatomic, retain) IBOutlet UIButton *XYButton63;
@property (nonatomic, retain) IBOutlet UIButton *XYButton64;
@property (nonatomic, retain) IBOutlet UIButton *XYButton65;
@property (nonatomic, retain) IBOutlet UIButton *XYButton66;
@property (nonatomic, retain) IBOutlet UIButton *XYButton67;
@property (nonatomic, retain) IBOutlet UIButton *XYButton68;
@property (nonatomic, retain) IBOutlet UIButton *XYButton69;
@property (nonatomic, retain) IBOutlet UIButton *XYButton70;
@property (nonatomic, retain) IBOutlet UIButton *XYButton71;
@property (nonatomic, retain) IBOutlet UIButton *XYButton72;
@property (nonatomic, retain) IBOutlet UIButton *XYButton73;
@property (nonatomic, retain) IBOutlet UIButton *XYButton74;
@property (nonatomic, retain) IBOutlet UIButton *XYButton75;
@property (nonatomic, retain) IBOutlet UIButton *XYButton76;
@property (nonatomic, retain) IBOutlet UIButton *XYButton77;
@property (nonatomic, retain) IBOutlet UIButton *XYButton78;
@property (nonatomic, retain) IBOutlet UIButton *XYButton79;
@property (nonatomic, retain) IBOutlet UIButton *XYButton80;
@property (nonatomic, retain) IBOutlet UIButton *XYButton81;
@property (nonatomic, retain) IBOutlet UIButton *XYButton82;
@property (nonatomic, retain) IBOutlet UIButton *XYButton83;
@property (nonatomic, retain) IBOutlet UIButton *XYButton84;
@property (nonatomic, retain) IBOutlet UIButton *XYButton85;
@property (nonatomic, retain) IBOutlet UIButton *XYButton86;
@property (nonatomic, retain) IBOutlet UIButton *XYButton87;
@property (nonatomic, retain) IBOutlet UIButton *XYButton88;
@property (nonatomic, retain) IBOutlet UIButton *XYButton89;
@property (nonatomic, retain) IBOutlet UIButton *XYButton90;
@property (nonatomic, retain) IBOutlet UIButton *XYButton91;
@property (nonatomic, retain) IBOutlet UIButton *XYButton92;
@property (nonatomic, retain) IBOutlet UIButton *XYButton93;
@property (nonatomic, retain) IBOutlet UIButton *XYButton94;
@property (nonatomic, retain) IBOutlet UIButton *XYButton95;
@property (nonatomic, retain) IBOutlet UIButton *XYButton96;
@property (nonatomic, retain) IBOutlet UIButton *XYButton97;
@property (nonatomic, retain) IBOutlet UIButton *XYButton98;
@property (nonatomic, retain) IBOutlet UIButton *XYButton99;



@end

