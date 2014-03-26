//
//  lbCredentialStore.m
//  Leaderboard
//
//  Created by John D. Gaffney on 3/17/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbCredentialStore.h"
#import "SSKeychain.h"

#define SERVICE_NAME @"NSScreencast-AuthClient"
#define AUTH_TOKEN_KEY @"auth_token"

@implementation lbCredentialStore

- (BOOL)isLoggedIn {
    return [self authToken] != nil;
}

- (void)clearSavedCredentials {
    [self setAuthToken:nil];
}

- (NSString *)authToken {
    return [self secureValueForKey:AUTH_TOKEN_KEY];
}

- (void)setAuthToken:(NSString *)authToken {
    [self setSecureValue:authToken forKey:AUTH_TOKEN_KEY];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"token-changed" object:self];
}

- (void)setSecureValue:(NSString *)value forKey:(NSString *)key {
    if (value) {
        [SSKeychain setPassword:value
                     forService:SERVICE_NAME
                        account:key];
    } else {
        [SSKeychain deletePasswordForService:SERVICE_NAME account:key];
    }
}

- (NSString *)secureValueForKey:(NSString *)key {
    return [SSKeychain passwordForService:SERVICE_NAME account:key];
}

@end
