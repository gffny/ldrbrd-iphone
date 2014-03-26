//
//  RAIConstants.h
//  ConncommUser
//
//  Created by John D. Gaffney on 12/5/13.
//  Copyright (c) 2013 Roundarchisobar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lbConstants : NSObject

# pragma mark -
# pragma mark segue name constants

#define seg_entryToHome @"initialToHomeSeg"
#define seg_entryToLogin @"initialToAuthSeg"
#define seg_loginToHome @"authToHomeSeg"
#define seg_menuToRoundDetail @"menuToRoundDetailSeg"
#define seg_menuToPlayRound @"menuToPlayRoundSeg"
#define seg_menuToCourseChoice @"menuToCourseChoiceSeg"
#define seg_roundDetailToPlayRound @"roundDetailToPlayRoundSeg"
#define seg_courseChoiceToCourseDetail @"courseChoiceToCourseDetailSeg"
#define seg_playRoundToRoundOverview @"playRoundToRoundOverviewSeg"

# pragma mark -
# pragma mark NSUserDefaults keys

#define key_USER_VALIDATED @"USER_VALIDATED"
#define key_CUSTOMER_ID @"CUSTOMER_ID"
#define key_FIRST_NAME @"FIRST_NAME"
#define key_LAST_NAME @"LAST_NAME"
#define key_EMAIL_ADDRESS @"EMAIL_ADDRESS"

# pragma mark -
# pragma mark URLS
#define url_base @"http://ec2-54-227-0-244.compute-1.amazonaws.com:8080"
#define url_login @"/isobar/api/v1/catalog/customer/"
#define url_departments @"/isobar/api/v1/catalog/store/location/"
#define url_store_catalog @"/isobar/api/v1/catalog/store/catalog/"

#define kAPIKey @"AIzaSyCYGSWqO5mqfMQbG5AL6rbRYpMten1OV0Y"

@end
