//
//  ViewController.m
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ViewController.h"
#import "ProdutsModel.h"

static NSString* const kBaseURL = @"http://localhost:3000/productos/5537c72f231259e95dcfa7e0";

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
    NSLog(@"Button pressed");
    //Warning: REST add URL to persist data
    NSURL* url = [NSURL URLWithString:kBaseURL];
    
    //    #warning REST create the request with the url
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    //    #warning REST PUT update or POST create
    //    request.HTTPMethod = isExistingLocation ? @"PUT" : @"POST"; //2
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
                   NSLog(@"obj class:%@", [obj class]);
                   NSLog(@"obj: %@", obj);
               }
           }
       }];
    [dataTask resume]; //8
}
@end
