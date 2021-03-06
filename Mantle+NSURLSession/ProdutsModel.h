//
//  ProdutsModel.h
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle.h>
#import "ReviewModel.h"


typedef enum : NSUInteger {
    GHIssueStateOpen,
    GHIssueStateClosed
} GHIssueState;


@interface ProdutsModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSNumber *shine;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *rarity;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSNumber *faces;
@property (nonatomic, strong) NSArray  *reviewModel;
@property (nonatomic, assign, readonly) GHIssueState state;

@end
