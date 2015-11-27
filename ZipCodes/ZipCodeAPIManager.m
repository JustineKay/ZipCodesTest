//
//  ZipCodeAPIManager.m
//  ZipCodes
//
//  Created by Justine Kay on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#define ZipCodeAPIKey @"https://www.zipcodeapi.com/rest/qUHhZxIxJxa09butR3kEaOT2KbK7WrQnmxEl5nTPU3P4fkx6oSKyGEAqPlxMMo99/city-zips.json"

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
