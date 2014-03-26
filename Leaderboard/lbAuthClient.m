//
//  lbAuthClient.m
//  Leaderboard
//
//  Created by John D. Gaffney on 3/17/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbAuthClient.h"
#import "lbCredentialStore.h"

#define BASE_URL @"http://nsscreencast-auth-server.herokuapp.com"
@implementation lbAuthClient

+ (id)sharedClient {
    static lbAuthClient *__instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:BASE_URL];
        __instance = [[lbAuthClient alloc] initWithBaseURL:baseUrl];
    });
    return __instance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self setRequestSerializer: [AFJSONRequestSerializer serializer]];
        [self setAuthTokenHeader];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(tokenChanged:)
                                                     name:@"token-changed"
                                                   object:nil];
    }
    return self;
}

- (void)setAuthTokenHeader {
    lbCredentialStore *store = [[lbCredentialStore alloc] init];
    NSString *authToken = [store authToken];
}

- (void)tokenChanged:(NSNotification *)notification {
    [self setAuthTokenHeader];
}

@end