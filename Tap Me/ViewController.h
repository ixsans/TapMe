//
//  ViewController.h
//  Tap Me
//
//  Created by Ikhsan on 1/2/17.
//  Copyright © 2017 Ikhsan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
}

-(IBAction)buttonPressed;

@end

