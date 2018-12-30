//
//  main.m
//  Ruler
//
//  Created by Mac on 12/25/18.
//  Copyright © 2018 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSApplication.sharedApplication.delegate = [[AppDelegate alloc] init];
    return NSApplicationMain(argc, argv);
}
