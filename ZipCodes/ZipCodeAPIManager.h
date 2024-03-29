//
//  ZipCodeAPIManager.h
//  ZipCodes
//
//  Created by Justine Gartner on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZipCodeAPIManager : NSObject

+ (void)GETZipCodesWithCity: (NSString *)city
                      state: (NSString *)state
          CompletionHandler:(void(^)(id results))completionHandler;

@end
