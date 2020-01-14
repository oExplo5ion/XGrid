//
//  PersistantStorage.m
//  XGrid
//
//  Created by Mac on 1/6/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "PersistantStorage.h"

@implementation PersistantStorage

#pragma public
+(void)setSettings:(LinesSettings*)settings {
    [PersistantStorage prepeare];
    
    NSString* json = [settings toJSON];
    if (json == nil) { return; }
    
    NSURL *file = [[PersistantStorage directory] URLByAppendingPathComponent:@"settings.json"];
    if (file == nil) { return; }
    
    BOOL setFile = [[NSFileManager defaultManager] createFileAtPath:file.path contents:nil attributes:nil];
    if (!setFile) { return; }

    [json writeToFile:file.path atomically:TRUE encoding:NSUTF16StringEncoding error:nil];
}

+(LinesSettings* _Nullable)getSettings {
    NSURL *file = [[PersistantStorage directory] URLByAppendingPathComponent:@"settings.json"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:file.path]) { return nil; }
    NSData *data = [NSData dataWithContentsOfFile:file.path];
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"%@", error);
        return nil;
    }
    return [LinesSettings fromJSON:json];
}

#pragma private
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
