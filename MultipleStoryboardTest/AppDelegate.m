//
//  AppDelegate.m
//  MultipleStoryboardTest
//
//  Created by KAKEGAWA Atsushi on 2013/03/24.
//  Copyright (c) 2013年 KAKEGAWA Atsushi. All rights reserved.
//

#import "AppDelegate.h"
#import "Notifications.h"

@interface AppDelegate () {
    UIViewController *_anotherViewRootViewController;
}

@property (nonatomic) UIViewController *mainViewRootViewController;
@property (nonatomic, readonly) UIViewController *anotherViewRootViewController;

@end

@implementation AppDelegate

#pragma mark - Accessor methods

- (UIViewController *)anotherViewRootViewController
{
    if (!_anotherViewRootViewController) {
        UIStoryboard *anotherStoryboard = [UIStoryboard storyboardWithName:@"AnotherStoryboard" bundle:[NSBundle mainBundle]];
        _anotherViewRootViewController = [anotherStoryboard instantiateInitialViewController];
    }
    
    return _anotherViewRootViewController;
}

#pragma mark - Lifecycle methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // MainStoryboardのInitialViewControllerの参照を保持する
    self.mainViewRootViewController = self.window.rootViewController;
    
    __weak typeof(self) weakSelf = self;
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [center addObserverForName:ShowMainViewNotification object:nil queue:queue usingBlock:^(NSNotification *note) {
        [weakSelf showMainView];
    }];
    [center addObserverForName:ShowAnotherViewNotification object:nil queue:queue usingBlock:^(NSNotification *note) {
        [weakSelf showAnotherView];
    }];
    
    return YES;
}

#pragma mark - Private methods

- (void)showMainView
{
    if (self.window.rootViewController == self.mainViewRootViewController) {
        return;
    }
    
    self.window.rootViewController = self.mainViewRootViewController;
    
    // rootViewController差し替え時のトランジション
    __weak typeof(self) weakSelf = self;
    self.mainViewRootViewController.view.hidden = YES;
    [UIView transitionWithView:self.window
                      duration:0.6f
                       options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews
                    animations:^{
                        weakSelf.mainViewRootViewController.view.hidden = NO;
                    }
                    completion:nil];
}

- (void)showAnotherView
{
    if (self.window.rootViewController == self.anotherViewRootViewController) {
        return;
    }
    
    self.window.rootViewController = self.anotherViewRootViewController;
    
    // rootViewController差し替え時のトランジション
    __weak typeof(self) weakSelf = self;
    self.anotherViewRootViewController.view.hidden = YES;
    [UIView transitionWithView:self.window
                      duration:0.6f
                       options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews
                    animations:^{
                        weakSelf.anotherViewRootViewController.view.hidden = NO;
                    }
                    completion:nil];
}

@end
