//
//  EditableTableViewCell.h
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditableTableViewCell : UITableViewCell {
	UITextField *titleField;
}

@property (nonatomic, retain) IBOutlet UITextField *titleField;

@end
