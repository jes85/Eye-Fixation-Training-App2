//
//  EFTViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/12/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTViewController.h"

static const CGFloat kShrinkFactor = .8;

@interface EFTViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIImageView *illinoisRetinaCenterImageView;
@property (weak, nonatomic) IBOutlet UIButton *redCrossButton;

@property (nonatomic) NSArray *labels;

@property (nonatomic) CGFloat redCrossWidth;
@property (nonatomic) CGFloat redCrossHeight;

@property (nonatomic) NSUInteger redCrossPressedCount;

@end

@implementation EFTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.redCrossButton.hidden = YES; //maybe just set as hidden in storyboard

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self displayLabels];
    self.redCrossHeight = 100;//change based on settings and platform
    self.redCrossWidth = 100;
    self.redCrossPressedCount = 0;
    
}

-(NSArray *)labels
{
    if(_labels)_labels = [[NSMutableArray alloc]init];
    return _labels;
}
- (void)hideLabels
{
    self.titleLabel.hidden=YES;
    self.label1.hidden=YES;
    self.label2.hidden=YES;
    self.label3.hidden=YES;
    
    self.startButton.hidden=YES;
    self.illinoisRetinaCenterImageView.hidden=YES;
    
    self.redCrossButton.hidden=NO;
}
-(void)displayLabels
{
    self.titleLabel.hidden=NO;
    self.label1.hidden=NO;
    self.label2.hidden=NO;
    self.label3.hidden=NO;
    
    self.startButton.hidden=NO;
    self.illinoisRetinaCenterImageView.hidden=NO;
    
    self.redCrossButton.hidden=YES;
    
    self.redCrossHeight = 100;//change based on settings and platform
    self.redCrossWidth = 100;
    self.redCrossPressedCount = 0;
}
-(void)switchRedCrossToRandomLocation
{
    
    CGFloat x = (CGFloat)(arc4random() % (int)(self.view.bounds.size.width - self.redCrossButton.frame.size.width));
    CGFloat y = (CGFloat)(arc4random() % (int)(self.view.bounds.size.height - self.redCrossButton.frame.size.height));
    
    CGPoint redXOrigin = CGPointMake(x, y);
    CGRect frame2 = self.redCrossButton.frame;
    frame2.origin = redXOrigin;
    
    self.redCrossButton.frame = frame2;
    
}
-(void)shrinkRedCross
{
   
        self.redCrossButton.bounds = CGRectMake(0,0,self.redCrossButton.bounds.size.width*kShrinkFactor, self.redCrossButton.bounds.size.height*kShrinkFactor);
    

}
- (IBAction)backgroundTouched:(id)sender {
    [self displayLabels];
    self.redCrossButton.bounds = CGRectMake(0, 0, self.redCrossWidth, self.redCrossHeight);
}
- (IBAction)startButtonPressed:(id)sender {
    [self hideLabels];
    [self switchRedCrossToRandomLocation];
    
}

- (IBAction)redCrossTouched:(id)sender {
     self.redCrossPressedCount++;
     if(self.redCrossPressedCount %3 ==0){//shrink red cross every 3 presses
         [self shrinkRedCross];
     }
    [self switchRedCrossToRandomLocation];
   
}


@end
