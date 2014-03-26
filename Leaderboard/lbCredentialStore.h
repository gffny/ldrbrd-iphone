//
//  lbCredentialStore.h
//  Leaderboard
//
//  Created by John D. Gaffney on 3/17/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lbCredentialStore : NSObject

- (BOOL)isLoggedIn;
- (void)clearSavedCredentials;
- (NSString *)authToken;
- (void)setAuthToken:(NSString *)authToken;

@end
