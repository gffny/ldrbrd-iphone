//
//  lbAuthClient.h
//  Leaderboard
//
//  Created by John D. Gaffney on 3/17/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface lbAuthClient : AFHTTPRequestOperationManager

+ (id)sharedClient;

@end
