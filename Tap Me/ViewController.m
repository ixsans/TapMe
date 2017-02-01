//
//  ViewController.m
//  Tap Me
//
//  Created by Ikhsan on 1/2/17.
//  Copyright © 2017 Ikhsan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    [self setupGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonPressed{
    
    count++;
    
    NSString *scoreText = [NSString stringWithFormat:@"Score\n%li", (long)count];
    scoreLabel.text = scoreText;
    
}

- (void)setupGame{
    
    seconds = 30;
    count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %li", (long)seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li ", (long)count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subsctractTime) userInfo:nil repeats:YES];
    
}

- (void) subsctractTime{
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"%li", (long)seconds];
    
    if(seconds == 0){
        [timer invalidate];
        
        NSString *scoreMessage = [NSString stringWithFormat:@"You scored %ld points", (long)count];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time is up!" message:scoreMessage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *playAgain = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:true completion:nil];
            [self setupGame];
        }];
        
        UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:true completion:nil];
            
        }];
        
        [alert addAction:playAgain];
        [alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}


@end
