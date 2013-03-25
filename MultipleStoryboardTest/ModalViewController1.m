//
//  ModalViewController1.m
//  MultipleStoryboardTest
//
//  Created by KAKEGAWA Atsushi on 2013/03/24.
//  Copyright (c) 2013年 KAKEGAWA Atsushi. All rights reserved.
//

#import "ModalViewController1.h"

@interface ModalViewController1 ()

@end

@implementation ModalViewController1

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

- (IBAction)closeButtonDidTouch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
