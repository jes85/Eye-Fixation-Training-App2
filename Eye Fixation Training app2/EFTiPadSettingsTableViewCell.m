//
//  EFTiPadSettingsTableViewCell.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/27/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTiPadSettingsTableViewCell.h"

@implementation EFTiPadSettingsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [[self redCrossImageView] addObserver:self
                           forKeyPath:@"redCross"
                              options:NSKeyValueObservingOptionOld
                              context:NULL];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
// The reason we’re observing changes is that if you create a table view cell, return it to the
// table view, and then later add an image (perhaps after doing some background processing), you
// need to call -setNeedsLayout on the cell for it to add the image view to its view hierarchy. We
// asked the change dictionary to contain the old value because this only needs to happen if the
// image was previously nil.
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == [self redCrossImageView] &&
        [keyPath isEqualToString:@"redCross"] &&
        ([change objectForKey:NSKeyValueChangeOldKey] == nil ||
         [change objectForKey:NSKeyValueChangeOldKey] == [NSNull null])) {
            [self setNeedsLayout];
        }
}


@end
