//
//  ViewController.m
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ViewController.h"
#import "ProdutsModel.h"
//array 553fab17fcdb0af8a8af8dbe
//dictionary 553929abb6d8be6c8969cbfd
static NSString* const kBaseURL = @"http://localhost:3000/productos/553fab17fcdb0af8a8af8dbe";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getButton:(UIButton *)sender {
    NSLog(@"Button pressed");    //Warning: REST add URL to persist data
    NSURL* url = [NSURL URLWithString:kBaseURL];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod =@"GET";
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"]; //4
    
    //id
    NSURLSessionConfiguration* config =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask =
    [session dataTaskWithRequest:request
       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
           if (error == nil) {
               NSError *restError = nil;
               NSDictionary *restDict = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:0
                                                                          error:&restError];
               NSArray * restArray    = restDict[@"productos"];
               NSDictionary *jsonDict = [restDict[@"productos"] firstObject];
               NSError *jsonError = nil;
               
//               ProdutsModel * productModel = [MTLJSONAdapter modelOfClass:[ProdutsModel class] fromJSONDictionary:jsonDict error:&jsonError];
               NSArray * productsModels = [MTLJSONAdapter modelsOfClass:[ProdutsModel class] fromJSONArray:restArray error:&restError];
               
               NSLog(@"Error: %@",jsonError);
               NSLog(@"jsonDict: %@",jsonDict);
               for (id obj in productsModels)
               {
                   //I should identify the class too, to do the casting
                   if ([obj class] == [ProdutsModel class]) {
                       ProdutsModel * pm = (ProdutsModel *)obj;
//                       NSLog(@"obj class:%@", [obj class]);
                       NSLog(@"pm: %@", pm);
                       //here I should identify the class too, to do the casting
                       ReviewModel * rm   = [pm.reviewModel firstObject];
                       ReviewModel * rmLo = [pm.reviewModel lastObject];
//                       NSLog(@"[pm.reviewModel firstObject] %@", rm.body);
                       NSLog(@"first rm: \n%@", rm.body);
                       NSLog(@"last rm:  \n%@", rmLo.body);
                   }
               }
           }
       }];
    [dataTask resume]; //8
}
@end
