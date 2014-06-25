//
//  MenuViewController.m
//  WeekThree
//
//  Created by Jason Chua on 6/24/14.
//  Copyright (c) 2014 Jason Chua. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *menuView;
- (IBAction)onHeadlinePan:(UIPanGestureRecognizer *)sender;


@property (weak, nonatomic) IBOutlet UIView *headlineView;
- (IBAction)onNewsPan:(UIPanGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *newsView;
- (IBAction)onHVPan:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *HV;

@property (assign,nonatomic) CGPoint offset;

@end

@implementation MenuViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onNewsPan:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        
        NSLog(@"NS started! %f %f", touchPosition.x, touchPosition.y);
        
        self.offset = CGPointMake(touchPosition.x - self.newsView.center.x, touchPosition.y - self.newsView.center.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"NS moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);
        
        
        
        self.newsView.center = CGPointMake(touchPosition.x - self.offset.x , self.newsView.center.y);
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        //check state of news and animate left or right accordingly
        if (self.newsView.center.x > 723) {
            //animate down
            [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:8.0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.newsView.center = CGPointMake(723, 441);
            } completion:nil];
            
        }
        else if (self.newsView.center.x < -403){
            //animate up
            [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:8.0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.newsView.center = CGPointMake(-403, 441);
            } completion:nil];
            
        }

    }

    
}
- (IBAction)onHeadlinePan:(UIPanGestureRecognizer *)sender {
    
//    CGPoint touchPosition = [sender locationInView:self.view];
//    
//    if (sender.state == UIGestureRecognizerStateBegan ) {
//        
//        NSLog(@"HL started! %f %f", touchPosition.x, touchPosition.y);
//        
//        self.offset = CGPointMake(touchPosition.x - self.headlineView.center.x, touchPosition.y - self.headlineView.center.y);
//        
//        
//    } else if (sender.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"HL moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);
//        
//        
//        
//        self.headlineView.center = CGPointMake(self.headlineView.center.x , touchPosition.y - self.offset.y);
//        
//    }else if (sender.state == UIGestureRecognizerStateEnded) {
//        //check state of HV and animate up or down accordingly
//        
//    }
    
}
- (IBAction)onHVPan:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];

    if (sender.state == UIGestureRecognizerStateBegan ) {

        NSLog(@"HL started! %f %f", touchPosition.x, touchPosition.y);

        self.offset = CGPointMake(touchPosition.x - self.HV.center.x, touchPosition.y - self.HV.center.y);


    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"HL moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);


        self.HV.center = CGPointMake(self.HV.center.x , touchPosition.y - self.offset.y);

    } else if (sender.state == UIGestureRecognizerStateEnded) {
        //check state of HV and animate up or down accordingly
        if (self.HV.center.y > 568) {
            //animate down
            [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:8.0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.HV.center = CGPointMake(160, 805);
            } completion:nil];
            
        }
        else if (self.HV.center.y < 568){
            //animate up
            [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:8.0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.HV.center = CGPointMake(160, 284);
            } completion:nil];
            
        }

    }

}
@end
