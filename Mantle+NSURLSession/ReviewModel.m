//
//  ReviewModel.m
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ReviewModel.h"

@implementation ReviewModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             NSStringFromSelector(@selector(body)) : @"body",
             NSStringFromSelector(@selector(stars)) : @"stars",
             NSStringFromSelector(@selector(author)) : @"author"
             };
}
@end
