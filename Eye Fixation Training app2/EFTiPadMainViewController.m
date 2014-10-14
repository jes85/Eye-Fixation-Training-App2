//
//  EFTiPadMainViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 10/10/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTiPadMainViewController.h"

@interface EFTiPadMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel1;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel2;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *directionsButton;
@property (weak, nonatomic) IBOutlet UIImageView *illinoisRetinaCenterImageView;
@property (weak, nonatomic) IBOutlet UIImageView *redCrossImageView;

@end

@implementation EFTiPadMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)backgroundTouched:(id)sender {
}

- (IBAction)startButtonPressed:(id)sender {
}
- (IBAction)directionsButtonTouched:(id)sender {
}
*/


@end
