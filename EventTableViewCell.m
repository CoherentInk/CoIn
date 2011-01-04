//
//  EventTableViewCell.m
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import "EventTableViewCell.h"


@implementation EventTableViewCell

@synthesize titleField, locationLabel, summaryLabel, detailDisclosureButton;

- (void)willTransitionToState:(UITableViewCellStateMask)state {
	[super willTransitionToState:state];
	
	if (state & UITableViewCellStateEditingMask) {
		titleField.enabled = YES;
	}
}

- (void)didTransitionToState:(UITableViewCellStateMask)state {
	[super didTransitionToState:state];
	
	if (!(state & UITableViewCellStateEditingMask)) {
		titleField.enabled = NO;
	}
}

- (void)dealloc {
	[titleField release];
	[locationLabel release];
	[summaryLabel release];
	[detailDisclosureButton release];
    [super dealloc];
}


@end
