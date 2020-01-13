//
//  LinesSettings.m
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "LinesSettings.h"

@implementation LinesSettings

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.width = 3;
        self.color = NSColor.cyanColor;
    }
    return self;
}

-(NSString* _Nullable)toJSON {
    return nil;
//    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] init];
//    [mutDict setValue:self.color forKey:@"color"];
//    [mutDict setValue:[NSNumber numberWithInt:self.width] forKey:@"width"];
//
//    NSArray *dataArr = [NSArray arrayWithObject:mutDict];
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataArr options:NSJSONWritingPrettyPrinted error:nil];
//
//    if (error != nil) { return nil; }
//
//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
