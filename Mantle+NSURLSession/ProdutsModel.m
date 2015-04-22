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
             @"name": @"name",
             @"shine": @"shine",
             @"price": @"price",
             @"rarity": @"rarity",
             @"color": @"color",
             @"faces": @"faces",
             @"story": @"description",
//             @"body": @"reviews.body",
//             @"stars": @"review.stars",
//             @"author": @"review.author"
             };
}
@end
