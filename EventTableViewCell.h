//
//  EventTableViewCell.h
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventTableViewCell : UITableViewCell {
	UITextField *titleField;
	UILabel *locationLabel;
	UILabel *summaryLabel;
	UIButton *detailDisclosureButton;
}

@property (nonatomic, retain) IBOutlet UITextField *titleField;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) IBOutlet UILabel *summaryLabel;

@property (nonatomic, retain) IBOutlet UIButton *detailDisclosureButton;

@end
