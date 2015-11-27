//
//  ZipCodeData.m
//  ZipCodes
//
//  Created by Justine Gartner on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import "ZipCodeData.h"
#import "ZipCodeAPIManager.h"

@implementation ZipCodeData

-(void)initializeData{
    
    self.allZipCodes = [[NSMutableArray alloc] init];
    
    //Queens Zip Codes
    
    NSArray *queensZipCodes =  @[@"11692",
                                 @"11102",
                                 @"11359",
                                 @"11426",
                                 @"11697",
                                 @"11411",
                                 @"11356",
                                 @"11368",
                                 @"11369",
                                 @"11373",
                                 @"11690",
                                 @"11002",
                                 @"11351",
                                 @"11375",
                                 @"11365",
                                 @"11004",
                                 @"11423",
                                 @"11414",
                                 @"11372",
                                 @"11405",
                                 @"11415",
                                 @"11362",
                                 @"11101",
                                 @"11378",
                                 @"11379",
                                 @"11364",
                                 @"11416",
                                 @"11427",
                                 @"11374",
                                 @"11418",
                                 @"11385",
                                 @"11694",
                                 @"11422",
                                 @"11412",
                                 @"11420",
                                 @"11419",
                                 @"11413",
                                 @"11104",
                                 @"11357",
                                 @"11421",
                                 @"11377"
                                 ];
    
    for (int i = 0; i < queensZipCodes.count; i++) {
        
        ZipCode *zip = [[ZipCode alloc] init];
        zip.borough = @"Queens";
        zip.number = queensZipCodes[i];
        
        [self.allZipCodes addObject:zip];
    }
    
    NSLog(@"Queens ZipCodes count: %ld", queensZipCodes.count);
    
    //StatenIsland Zip Codes
    
    NSArray *statenIslandZipCodes = @[@"10301",
                                      @"10302",
                                      @"10303",
                                      @"10304",
                                      @"10305",
                                      @"10306",
                                      @"10307",
                                      @"10308",
                                      @"10309",
                                      @"10310",
                                      @"10311",
                                      @"10312",
                                      @"10314"
                                      ];
    
    for (int i = 0; i < statenIslandZipCodes.count; i++) {
        ZipCode *zip = [[ZipCode alloc] init];
        zip.borough = @"Staten Island";
        zip.number = statenIslandZipCodes[i];
        
        [self.allZipCodes addObject:zip];
    }
    
    NSLog(@"Self.allZipCodes.count: %ld (QNS and SI)", self.allZipCodes.count);
    
    NSLog(@"SI ZipCodes count: %ld", statenIslandZipCodes.count);
    
    NSString *brooklyn = @"Brooklyn";
    NSString *manhattan = @"New%20York";
    NSString *bronx = @"Bronx";
    NSString *ny = @"NY";
    
    //Brooklyn Zip Codes
    
    [ZipCodeAPIManager GETZipCodesWithCity:brooklyn state:ny CompletionHandler:^(id results) {
        
        if ([results isKindOfClass:[NSDictionary class]]) {
            
            self.allZipCodes = [[NSMutableArray alloc]init];
            
            //NSLog(@"zipcodes: %@", results);
            
            NSArray *zipCodes = results[@"zip_codes"];
            
            //NSLog(@"searchResults: %@", zipCodes);
            
            for (NSString *result in zipCodes){
                
                ZipCode *zipCode = [[ZipCode alloc] init];
                zipCode.borough = brooklyn;
                zipCode.number = result;
                
                [self.allZipCodes addObject:zipCode];
            }
        }
    }];
    
    NSLog(@"self.allZipCodes.count: %ld(QNS, SI, BK)", self.allZipCodes.count);
    
    
    
    //Manhattan Zip Codes
    
    [ZipCodeAPIManager GETZipCodesWithCity:manhattan state:ny CompletionHandler:^(id results) {
        if ([results isKindOfClass:[NSDictionary class]]) {
            
            NSArray *zipCodes = results[@"zip_codes"];
            
            //NSLog(@"searchResults: %@", zipCodes);
            
            for (NSString *result in zipCodes){
                
                ZipCode *zipCode = [[ZipCode alloc] init];
                zipCode.borough = @"Manhattan";
                zipCode.number = result;
                
                [self.allZipCodes addObject:zipCode];
            }
            
        }
        
    }];
    
    NSLog(@"self.allZipCodes.count: %ld(QNS, SI, BK, MAN)", self.allZipCodes.count);
    
    //Bronx Zip Codes
    
    [ZipCodeAPIManager GETZipCodesWithCity:bronx state:ny CompletionHandler:^(id results) {
        if ([results isKindOfClass:[NSDictionary class]]) {
            
            NSArray *zipCodes = results[@"zip_codes"];
            
            //NSLog(@"searchResults: %@", zipCodes);
            
            for (NSString *result in zipCodes){
                
                ZipCode *zipCode = [[ZipCode alloc] init];
                zipCode.borough = bronx;
                zipCode.number = result;
                
                [self.allZipCodes addObject:zipCode];
                
            }
            
        }
        
    }];
    
    NSLog(@"self.allZipCodes.count: %ld (ALL)", self.allZipCodes.count);
    
   
}

@end
