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
#import "EFTConstants.h"

#define kVisualAcuityCellReuseIdentifier2050        @"VA 20/50"
#define kVisualAcuityCellReuseIdentifier20100       @"VA 20/100"
#define kVisualAcuityCellReuseIdentifier20200       @"VA 20/200"
#define kVisualAcuityCellReuseIdentifier20400       @"VA 20/400"
#define kVisualAcuityCellReuseIdentifier5200        @"VA 5' 200"

#define kRowHeight0                             125
#define kRowHeight1                             150
#define kRowHeight2                             175
#define kRowHeight3                             200
#define kRowHeight4                             225

@interface EFTiPadSettingsTableViewController ()

@property (nonatomic) NSDictionary *VASizes;
@property (nonatomic) NSMutableArray *VACellReuseIdentifiers;
@property (nonatomic) NSMutableArray *VACellRowHeights;

@end

@implementation EFTiPadSettingsTableViewController



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    EFTViewController *vc = (EFTViewController *)[self.tabBarController.viewControllers objectAtIndex:0];
    self.VASizes = vc.VASizes;
    
    
    self.VACellReuseIdentifiers = [[NSMutableArray alloc]initWithCapacity:[self.visualAcuityList count]];
    [self.VACellReuseIdentifiers addObject:kVisualAcuityCellReuseIdentifier2050];
    [self.VACellReuseIdentifiers addObject:kVisualAcuityCellReuseIdentifier20100];
    [self.VACellReuseIdentifiers addObject:kVisualAcuityCellReuseIdentifier20200];
    [self.VACellReuseIdentifiers addObject:kVisualAcuityCellReuseIdentifier20400];
    [self.VACellReuseIdentifiers addObject:kVisualAcuityCellReuseIdentifier5200];
    
    self.VACellRowHeights = [[NSMutableArray alloc]initWithCapacity:[self.visualAcuityList count]];
    [self.VACellRowHeights addObject:[NSNumber numberWithInteger: kRowHeight0 ]];
    [self.VACellRowHeights addObject:[NSNumber numberWithInteger: kRowHeight1 ]];
    [self.VACellRowHeights addObject:[NSNumber numberWithInteger: kRowHeight2 ]];
    [self.VACellRowHeights addObject:[NSNumber numberWithInteger: kRowHeight3 ]];
    [self.VACellRowHeights addObject:[NSNumber numberWithInteger: kRowHeight4 ]];

  
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.VACellRowHeights[indexPath.row] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EFTiPadSettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.VACellReuseIdentifiers[indexPath.row] forIndexPath:indexPath];
    
    // Set text
    NSString *visualAcuity =self.visualAcuityList[indexPath.row];
    cell.textLabel.text =visualAcuity;
    
    // Display image
    [cell.contentView addSubview:cell.redCrossImageView];
    
    // Display checkmark for cell that was previously selected
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:kVisualAcuitySetting] isEqualToString:visualAcuity]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    
    return cell;
}


@end
