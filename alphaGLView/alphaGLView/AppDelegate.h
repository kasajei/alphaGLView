//
//  AppDelegate.h
//  alphaGLView
//
//  Created by Kasajima Yasuo on 11/11/30.
//  Copyright kyoto 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
