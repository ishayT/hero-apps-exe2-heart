//
//  ViewController.m
//  hero apps exe2 heart
//
//  Created by Ishay on 5/15/18.
//  Copyright © 2018 Ishay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //the bool for playing the animation
    status = false;
    
    //call for animate
    [self animate: 0.7];
    
    
    //Add a tap gesture to the imageView
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [_heartImage setUserInteractionEnabled:YES];
    [_heartImage addGestureRecognizer:singleTap];
    
    
    
}

-(void)tapDetected{
    
    if (status == false) {
        status = true;
        NSLog(@"the status is true");
        [self animate:1.0];
    } else {
        status = false;
        NSLog(@"the status is false");
        [self animate:0.7];
    }
    
}

-(void)animate:(float)heartSize{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=0.7;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses= YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:heartSize];
    theAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.heartImage.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
}
    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
