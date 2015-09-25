//
//  AppDelegate.h
//  ZJFoundation
//
//  Created by YunTu on 15/8/18.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

//
#import "ZJRunLoopContext.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//
- (void)registerSource:(ZJRunLoopContext *)sourceInfo;

- (void)removeSource:(ZJRunLoopContext *)sourceInfo;

@end

