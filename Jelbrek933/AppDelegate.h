//
//  AppDelegate.h
//  Jelbrek933
//
//  Created by zDevin on 2017-06-23.
//  Copyright © 2017 PMJelbrek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

