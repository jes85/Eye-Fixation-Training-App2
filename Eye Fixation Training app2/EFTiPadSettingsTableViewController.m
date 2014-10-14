//
//  EFTiPadSettingsTableViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/27/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTiPadSettingsTableViewController.h"
#import "EFTiPadSettingsTableViewCell.h"
#import "EFTViewController.h"


#define kVisualAcuityCellReuseIdentifier    @"Visual Acuity Cell"
#define kVisualAcuitySetting                @"Visual Acuity Setting"


@interface EFTiPadSettingsTableViewController ()
@property (nonatomic) NSDictionary *VASizes;
@property (nonatomic) NSArray *rowHeights;
@end

@implementation EFTiPadSettingsTableViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    EFTViewController *vc = (EFTViewController *)[self.tabBarController.viewControllers objectAtIndex:0];
    self.VASizes = vc.VASizes;
    self.rowHeights = @[@100, @150, @200, @250, @300];

    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.rowHeights[indexPath.row] floatValue];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EFTiPadSettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVisualAcuityCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Set text
    NSString *visualAcuity =self.visualAcuityList[indexPath.row];
    cell.textLabel.text =visualAcuity;
    
    // Set red cross size based on visual acuity
    NSValue *value = [self.VASizes objectForKey:visualAcuity];
    CGSize size = [value CGSizeValue];
    CGPoint origin = cell.redCrossImageView.frame.origin;
    CGRect frame = CGRectMake(origin.x, origin.y, size.width, size.height);
    cell.redCrossImageView.frame = frame;
    
    [cell.contentView addSubview:cell.redCrossImageView];
    NSLog(@"%f", cell.redCrossImageView.frame.size.height);
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:kVisualAcuitySetting] isEqualToString:visualAcuity]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    
    return cell;
}



@end
