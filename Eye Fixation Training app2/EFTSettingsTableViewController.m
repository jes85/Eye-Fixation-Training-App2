//
//  EFTSettingsTableViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/14/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTSettingsTableViewController.h"
#import "EFTConstants.h"


@interface EFTSettingsTableViewController ()
@end

@implementation EFTSettingsTableViewController

-(NSArray *)visualAcuityList
{
    if(!_visualAcuityList)_visualAcuityList = [[NSArray alloc]init];
    return _visualAcuityList;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.visualAcuityList = @[kVisualAcuity1, kVisualAcuity2, kVisualAcuity3, kVisualAcuity4, kVisualAcuity5];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return kSettingsTitle;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.visualAcuityList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVisualAcuityCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *visualAcuity =self.visualAcuityList[indexPath.row];
    cell.textLabel.text =visualAcuity;
   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:kVisualAcuitySetting] isEqualToString:visualAcuity]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;

    }
  
    
    return cell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
		
        // if the cell was already selected, return (there's no need to do anything)
		UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
		if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark) {
			return;
		}
        
		// otherwise, uncheck all visible cells.
		for (UITableViewCell *cell in [tableView visibleCells]) {
			if (cell.accessoryType != UITableViewCellAccessoryNone) {
				cell.accessoryType = UITableViewCellAccessoryNone;
			}
		}
		selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
        // update UserDefaults for which visual acuity is selected
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
		[userDefaults setObject:self.visualAcuityList[indexPath.row] forKey:kVisualAcuitySetting];
	
}



@end
