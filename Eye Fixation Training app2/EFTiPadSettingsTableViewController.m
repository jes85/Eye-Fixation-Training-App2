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

@end

@implementation EFTiPadSettingsTableViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    EFTViewController *vc = (EFTViewController *)[self.tabBarController.viewControllers objectAtIndex:0];
    self.VASizes = vc.VASizes;

    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
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
    NSLog(@"%f", cell.redCrossImageView.frame.size.height);
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:kVisualAcuitySetting] isEqualToString:visualAcuity]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    
    //[cell setNeedsLayout];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
