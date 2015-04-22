//
//  ProdutsModel.m
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ProdutsModel.h"

@implementation ProdutsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             NSStringFromSelector(@selector(name)) : @"name",
             NSStringFromSelector(@selector(shine)) : @"shine",
             NSStringFromSelector(@selector(price)) : @"price",
             NSStringFromSelector(@selector(rarity)) : @"rarity",
             NSStringFromSelector(@selector(color)) : @"color",
             NSStringFromSelector(@selector(faces)) : @"faces",
             NSStringFromSelector(@selector(story)) : @"description",
             NSStringFromSelector(@selector(reviewModel)) : @"reviews"
            };
}
@end
