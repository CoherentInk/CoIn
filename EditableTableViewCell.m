//
//  EditableTableViewCell.m
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import "EditableTableViewCell.h"


@implementation EditableTableViewCell

@synthesize titleField;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
	titleField.enabled = editing;
}

- (void)dealloc {
	[titleField release];
    [super dealloc];
}


@end
