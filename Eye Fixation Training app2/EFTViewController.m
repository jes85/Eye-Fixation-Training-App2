//
//  EFTViewController.m
//  Eye Fixation Training app2
//
//  Created by Jeremy on 9/12/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

#import "EFTViewController.h"


#define kVisualAcuity1          @"20/50"
#define kVisualAcuity2          @"20/100"
#define kVisualAcuity3          @"20/200"
#define kVisualAcuity4          @"20/400"
#define kVisualAcuity5          @"5' 200"

#define kVisualAcuitySetting    @"Visual Acuity Setting"
static const CGFloat kShrinkFactor = .8;


@interface EFTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel1;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel2;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIImageView *illinoisRetinaCenterImageView;
@property (weak, nonatomic) IBOutlet UIImageView *redCrossImageView;
@property (weak, nonatomic) IBOutlet UIButton *directionsButton;


@property (nonatomic) CGSize redCrossSize;
@property (nonatomic) NSUInteger redCrossPressedCount;
@property (nonatomic) CGRect visibleFrame;
@property (nonatomic) CGFloat directionsButtonYLocation;

@end

@implementation EFTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.redCrossImageView.hidden = YES; //maybe just set as hidden in storyboard
    self.directionsButton.hidden = YES;
    self.visibleFrame = [self getVisibleFrame];
    
   [self determineCrossSizes];

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(![userDefaults stringForKey:kVisualAcuitySetting]){
        [userDefaults setObject:kVisualAcuity1 forKey:kVisualAcuitySetting];
    }
    NSString *visualAcuity = [userDefaults stringForKey:kVisualAcuitySetting];
    CGSize size = [[self.VASizes objectForKey:visualAcuity] CGSizeValue];
    
    [self saveCrossSize:size];
    [self displayLabels];
    self.redCrossPressedCount = 0;
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [self displayLabels];
   }
-(NSDictionary *)VASizes
    {
        if(!_VASizes) _VASizes = [[NSDictionary alloc]init];
        return _VASizes;
    }

- (CGRect)getVisibleFrame {
    CGRect frame;
    
    frame = CGRectMake(0, 0, 0, 0);
    
    
    CGSize size  = [[UIScreen mainScreen] bounds].size;
    frame.size.width = size.width;
    frame.size.height = size.height;

    CGFloat y =self.directionsButton.frame.origin.y+self.directionsButton.frame.size.height;
    self.directionsButtonYLocation = y;
    frame.size.height -= y;
    frame.origin.y+=y;
     
    
    //tab bar
        size = self.tabBarController.tabBar.frame.size;
        frame.size.height -= size.height;
    
   
    return frame;
}
-(void)determineCrossSizes //change to be based on platform
{
    CGSize size1 = CGSizeMake (50, 50);
    CGSize size2 = CGSizeMake (100, 100);
    CGSize size3 = CGSizeMake (150, 150);
    CGSize size4 = CGSizeMake (250, 250);
    CGSize size5 = CGSizeMake (300, 300);
    
    NSValue *value1 = [NSValue valueWithCGSize:size1];
    NSValue *value2 = [NSValue valueWithCGSize:size2];
    NSValue *value3 = [NSValue valueWithCGSize:size3];
    NSValue *value4 = [NSValue valueWithCGSize:size4];
    NSValue *value5 = [NSValue valueWithCGSize:size5];
    
    self.VASizes = @{kVisualAcuity1:value1, kVisualAcuity2:value2, kVisualAcuity3:value3, kVisualAcuity4:value4, kVisualAcuity5:value5};

    
}
-(void)saveCrossSize:(CGSize) size
{
   
    self.redCrossSize = size;
}
- (void)hideLabels
{
    self.titleLabel.hidden=YES;
    self.instructionLabel1.hidden=YES;
    self.instructionLabel2.hidden=YES;
    
    self.startButton.hidden=YES;
    self.illinoisRetinaCenterImageView.hidden=YES;
    
    self.redCrossImageView.hidden=NO;
    self.directionsButton.hidden = NO;

}
-(void)displayLabels
{
    self.titleLabel.hidden=NO;
    self.instructionLabel1.hidden=NO;
    self.instructionLabel2.hidden=NO;
    
    self.startButton.hidden=NO;
    self.illinoisRetinaCenterImageView.hidden=NO;
    
    self.redCrossImageView.hidden=YES;
    self.directionsButton.hidden = YES;

    
    
    
    self.redCrossPressedCount = 0;
    
    self.redCrossImageView.frame = CGRectMake(0, 0, self.redCrossSize.width, self.redCrossSize.height);
}
-(void)switchRedCrossToRandomLocation
{
    
    CGFloat x = (CGFloat)(arc4random() % (int)(self.visibleFrame.size.width - self.redCrossImageView.frame.size.width));
    CGFloat y = (CGFloat)(arc4random() % (int)(self.visibleFrame.size.height - self.redCrossImageView.frame.size.height) + self.directionsButtonYLocation);
    
    CGPoint redXOrigin = CGPointMake(x, y);
    CGRect frame2 = self.redCrossImageView.frame;
    frame2.origin = redXOrigin;
    
    self.redCrossImageView.frame = frame2;
    
}
-(void)shrinkRedCross
{
   
        self.redCrossImageView.bounds = CGRectMake(0,0,self.redCrossImageView.bounds.size.width*kShrinkFactor, self.redCrossImageView.bounds.size.height*kShrinkFactor);
    

}
- (IBAction)backgroundTouched:(id)sender {
    self.redCrossPressedCount++;
    if(self.redCrossPressedCount %3 ==0){//shrink red cross every 3 presses
        [self shrinkRedCross];
    }
    [self switchRedCrossToRandomLocation];

}
- (IBAction)startButtonPressed:(id)sender {
    [self hideLabels];
    [self switchRedCrossToRandomLocation];
    
}
- (IBAction)directionsButtonTouched:(id)sender {
    [self displayLabels];
   
}



@end
