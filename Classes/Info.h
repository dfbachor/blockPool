//
//  Info.h
//  bp2ipad
//
//  Created by David Bachor on 5/14/11.
//  Copyright 2011 dfb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate <NSObject>

- (void)didDismissModalView;

@end


@interface Info : UIViewController {
    id<ModalViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id<ModalViewControllerDelegate> delegate;

@end
