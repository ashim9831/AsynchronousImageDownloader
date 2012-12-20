//
//  ILAppDelegate.h
//  ImageLoader
//
//  Created by Ashim Samanta on 21/11/12.
//  Copyright (c) 2012 ashim9831@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILViewController;

@interface ILAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ILViewController *viewController;

@end
