//
//  Tab2ChildViewController.m
//  MultipleStoryboardTest
//
//  Created by KAKEGAWA Atsushi on 2013/03/24.
//  Copyright (c) 2013年 KAKEGAWA Atsushi. All rights reserved.
//

#import "Tab2ChildViewController.h"

@interface Tab2ChildViewController ()

@end

@implementation Tab2ChildViewController

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

- (IBAction)openButtonDidTouch:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SubStoryboard" bundle:[NSBundle mainBundle]];
    UIViewController *initialViewController = [storyboard instantiateInitialViewController];
    [self presentViewController:initialViewController animated:YES completion:nil];
}

@end
