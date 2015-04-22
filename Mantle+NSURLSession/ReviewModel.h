//
//  ReviewModel.h
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface ReviewModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *stars;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *author;

@end
