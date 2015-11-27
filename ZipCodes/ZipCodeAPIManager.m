//
//  ZipCodeAPIManager.m
//  ZipCodes
//
//  Created by Justine Kay on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#define ZipCodeAPIKey @"https://www.zipcodeapi.com/rest/84FlCl0maEOC6JCfcaeDWN04N3XeMw7VANgc8gzjVoW18zhlJwYFjZK73IlPesKO/city-zips.json/Brooklyn/NY"

#import <AFNetworking/AFNetworking.h>
#import "ZipCodeAPIManager.h"

@implementation ZipCodeAPIManager

+ (void)GETZipCodesWithCity: (NSString *)city
                             state: (NSString *)state
                     CompletionHandler:(void(^)(id results))completionHandler{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@", ZipCodeAPIKey, city, state];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        completionHandler(responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
}

@end
