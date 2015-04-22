//
//  ViewController.m
//  Mantle+NSURLSession
//
//  Created by Andres Kwan on 4/22/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ViewController.h"
static NSString* const kBaseURL = @"http://localhost:3000/productos/553784f9fa2899b67806287f";

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
                       NSError *error;
                       NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                options:0
                                                                                  error:&error];
                       for (id obj in jsonDict)
                       {
//                           self.dict1 = obj;
                           //here obj is a dictionary too
                           NSLog(@"obj class:%@", [obj class]);
                           //                NSLog(@"objt: %@",obj);
                           //                i+=1;
                           //                //here obj is a key of the obj dictionary
//                                           for (id obj2 in obj) {
//                                             NSLog(@"obj2 class:%@", [obj2 class]);
                           //                    NSLog(@"\nobj2 key: %@\n",obj2);
                           //                    NSLog(@"obj2 value: %@", [obj objectForKey:obj2]);
                           //
//                                           }
                       }
                       
                       //            NSLog(@"%@", );
                       //             NSArray* responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                       //            if ([responseArray count])
                       //            {
                       //                self.label.text = [jsonDict objectForKey:<#(id)#>;
                       //            }
                   }
               }];
    [dataTask resume]; //8
//    self.label.text = [self.dict1 objectForKey:@"title"];
//    self.label.text = [self.dict1 objectForKey:@"title"];
}
@end
