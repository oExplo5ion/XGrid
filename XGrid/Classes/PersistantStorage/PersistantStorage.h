//
//  PersistantStorage.h
//  XGrid
//
//  Created by Mac on 1/6/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinesSettings.h"

@interface PersistantStorage : NSObject

+(void) setSettings:(LinesSettings*)settings;
+(LinesSettings*) getSettings;

@end
