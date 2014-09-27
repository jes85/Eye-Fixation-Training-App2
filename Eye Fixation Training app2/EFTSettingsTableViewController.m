//
//  EFTSettingsTableViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/14/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTSettingsTableViewController.h"

#define kVisualAcuity1                      @"20/50"
#define kVisualAcuity2                      @"20/100"
#define kVisualAcuity3                      @"20/200"
#define kVisualAcuity4                      @"20/400"
#define kVisualAcuity5                      @"5' 200"

#define kVisualAcuityCellReuseIdentifier    @"Visual Acuity Cell"
#define kSettingsTitle                      @"Select Visual Acuity"
#define kVisualAcuitySetting                @"Visual Acuity Setting"

@interface EFTSettingsTableViewController ()
@property (nonatomic) NSArray *visualAcuityList;
@end

@implementation EFTSettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSArray *)visualAcuityList
{
    if(!_visualAcuityList)_visualAcuityList = [[NSArray alloc]init];
    return _visualAcuityList;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *array = @[kVisualAcuity1, kVisualAcuity2, kVisualAcuity3, kVisualAcuity4, kVisualAcuity5];
    self.visualAcuityList = array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return kSettingsTitle;
}
/*- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeaderHeight;
}*/
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
    /*if(indexPath.row ==0){//change to find out which one is selected
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    */
    
    return cell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
		// if we were already selected, bail and save some work.
		UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
		if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark) {
			return;
		}
        
		// uncheck all visible cells.
		for (UITableViewCell *cell in [tableView visibleCells]) {
			if (cell.accessoryType != UITableViewCellAccessoryNone) {
				cell.accessoryType = UITableViewCellAccessoryNone;
			}
		}
		selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
		[userDefaults setObject:self.visualAcuityList[indexPath.row] forKey:kVisualAcuitySetting];
	
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
