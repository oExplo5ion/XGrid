//
//  PersistantStorage.m
//  XGrid
//
//  Created by Mac on 1/6/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "PersistantStorage.h"

@implementation PersistantStorage

+(NSURL* _Nullable)directory {
    NSError *error;
    
    NSURL *support = [[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    
    if (error != nil) {
        NSLog(@"%@", error);
        return nil;
    }
    
    // create app's file
    NSString *bundle = [[NSBundle mainBundle] bundleIdentifier];
    return [support URLByAppendingPathComponent:bundle];
}

+(void)setSettings:(LinesSettings *)settings {
    [PersistantStorage prepeare];
}

+(LinesSettings *)getSettings {
    return [LinesSettings new];
}

+(void)prepeare {
    NSURL *directory = [PersistantStorage directory];
    if (directory == nil) { return; }
    
    // check if file exist, if it is -> return else create one
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:directory.absoluteString]) { return; }
    
    NSError *error;
    [fileManager createDirectoryAtURL:directory withIntermediateDirectories:true attributes:nil error:&error];
}

@end
