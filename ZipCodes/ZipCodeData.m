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
    
    NSLog(@"SI ZipCodes count: %ld", statenIslandZipCodes.count);
    
//    NSString *brooklyn = @"Brooklyn";
//    NSString *manhattan = @"New%20York";
//    NSString *bronx = @"Bronx";
//    NSString *ny = @"NY";
    
    //Brooklyn Zip Codes
    
    NSArray *brooklynZipCodes = @[@"11201",
                                  @"11202",
                                  @"11203",
                                  @"11204",
                                  @"11205",
                                  @"11206",
                                  @"11207",
                                  @"11208",
                                  @"11209",
                                  @"11210",
                                  @"11211",
                                  @"11212",
                                  @"11213",
                                  @"11214",
                                  @"11215",
                                  @"11216",
                                  @"11217",
                                  @"11218",
                                  @"11219",
                                  @"11220",
                                  @"11221",
                                  @"11222",
                                  @"11223",
                                  @"11224",
                                  @"11225",
                                  @"11226",
                                  @"11228",
                                  @"11229",
                                  @"11230",
                                  @"11231",
                                  @"11232",
                                  @"11233",
                                  @"11234",
                                  @"11235",
                                  @"11236",
                                  @"11237",
                                  @"11238",
                                  @"11239",
                                  @"11240",
                                  @"11241",
                                  @"11242",
                                  @"11243",
                                  @"11244",
                                  @"11245",
                                  @"11247",
                                  @"11248",
                                  @"11249",
                                  @"11251",
                                  @"11252",
                                  @"11254",
                                  @"11255",
                                  @"11256"
                                  ];
    
    for (int i = 0; i < brooklynZipCodes.count; i++) {
        ZipCode *zip = [[ZipCode alloc] init];
        zip.borough = @"Brooklyn";
        zip.number = brooklynZipCodes[i];
        
        [self.allZipCodes addObject:zip];
    }
    
    NSLog(@"Broklyn Zipcodes count: %ld", brooklynZipCodes.count);

    
//    [ZipCodeAPIManager GETZipCodesWithCity:brooklyn state:ny CompletionHandler:^(id results) {
//        
//        if ([results isKindOfClass:[NSDictionary class]]) {
//            
//            self.allZipCodes = [[NSMutableArray alloc]init];
//            
//            //NSLog(@"zipcodes: %@", results);
//            
//            NSArray *zipCodes = results[@"zip_codes"];
//            
//            //NSLog(@"searchResults: %@", zipCodes);
//            
//            for (NSString *result in zipCodes){
//                
//                ZipCode *zipCode = [[ZipCode alloc] init];
//                zipCode.borough = brooklyn;
//                zipCode.number = result;
//                
//                [self.allZipCodes addObject:zipCode];
//            }
//        }
//    }];
    
    
    //Manhattan Zip Codes
    
    NSArray *manhattanZipCodes = @[@"10001",
                                   @"10002",
                                   @"10003",
                                   @"10004",
                                   @"10005",
                                   @"10006",
                                   @"10007",
                                   @"10008",
                                   @"10009",
                                   @"10010",
                                   @"10011",
                                   @"10012",
                                   @"10013",
                                   @"10014",
                                   @"10015",
                                   @"10016",
                                   @"10017",
                                   @"10018",
                                   @"10019",
                                   @"10020",
                                   @"10021",
                                   @"10022",
                                   @"10023",
                                   @"10024",
                                   @"10025",
                                   @"10026",
                                   @"10027",
                                   @"10028",
                                   @"10029",
                                   @"10030",
                                   @"10031",
                                   @"10032",
                                   @"10033",
                                   @"10034",
                                   @"10035",
                                   @"10036",
                                   @"10037",
                                   @"10038",
                                   @"10039",
                                   @"10040",
                                   @"10041",
                                   @"10043",
                                   @"10044",
                                   @"10045",
                                   @"10046",
                                   @"10047",
                                   @"10048",
                                   @"10055",
                                   @"10060",
                                   @"10065",
                                   @"10069",
                                   @"10072",
                                   @"10075",
                                   @"10079",
                                   @"10080",
                                   @"10081",
                                   @"10082",
                                   @"10087",
                                   @"10090",
                                   @"10094",
                                   @"10095",
                                   @"10096",
                                   @"10098",
                                   @"10099",
                                   @"10101",
                                   @"10102",
                                   @"10103",
                                   @"10104",
                                   @"10105",
                                   @"10106",
                                   @"10107",
                                   @"10108",
                                   @"10109",
                                   @"10110",
                                   @"10111",
                                   @"10112",
                                   @"10113",
                                   @"10114",
                                   @"10115",
                                   @"10116",
                                   @"10117",
                                   @"10118",
                                   @"10119",
                                   @"10120",
                                   @"10121",
                                   @"10122",
                                   @"10123",
                                   @"10124",
                                   @"10125",
                                   @"10126",
                                   @"10128",
                                   @"10129",
                                   @"10130",
                                   @"10131",
                                   @"10132",
                                   @"10133",
                                   @"10138",
                                   @"10149",
                                   @"10150",
                                   @"10151",
                                   @"10152",
                                   @"10153",
                                   @"10154",
                                   @"10155",
                                   @"10156",
                                   @"10157",
                                   @"10158",
                                   @"10159",
                                   @"10160",
                                   @"10161",
                                   @"10162",
                                   @"10163",
                                   @"10164",
                                   @"10165",
                                   @"10166",
                                   @"10167",
                                   @"10168",
                                   @"10169",
                                   @"10170",
                                   @"10171",
                                   @"10172",
                                   @"10173",
                                   @"10174",
                                   @"10175",
                                   @"10176",
                                   @"10177",
                                   @"10178",
                                   @"10179",
                                   @"10184",
                                   @"10185",
                                   @"10196",
                                   @"10197",
                                   @"10199",
                                   @"10200",
                                   @"10203",
                                   @"10211",
                                   @"10212",
                                   @"10213",
                                   @"10242",
                                   @"10249",
                                   @"10256",
                                   @"10257",
                                   @"10258",
                                   @"10259",
                                   @"10260",
                                   @"10261",
                                   @"10265",
                                   @"10268",
                                   @"10269",
                                   @"10270",
                                   @"10271",
                                   @"10272",
                                   @"10273",
                                   @"10274",
                                   @"10275",
                                   @"10276",
                                   @"10277",
                                   @"10278",
                                   @"10279",
                                   @"10280",
                                   @"10281",
                                   @"10282",
                                   @"10285",
                                   @"10286",
                                   @"10292"
                                  ];
    
    for (int i = 0; i < manhattanZipCodes.count; i++) {
        ZipCode *zip = [[ZipCode alloc] init];
        zip.borough = @"Manhattan";
        zip.number = manhattanZipCodes[i];
        
        [self.allZipCodes addObject:zip];
    }
    
    NSLog(@"Manhattan ZipCodes count: %ld",manhattanZipCodes.count);

    
//    [ZipCodeAPIManager GETZipCodesWithCity:manhattan state:ny CompletionHandler:^(id results) {
//        if ([results isKindOfClass:[NSDictionary class]]) {
//            
//            NSArray *zipCodes = results[@"zip_codes"];
//            
//            //NSLog(@"searchResults: %@", zipCodes);
//            
//            for (NSString *result in zipCodes){
//                
//                ZipCode *zipCode = [[ZipCode alloc] init];
//                zipCode.borough = @"Manhattan";
//                zipCode.number = result;
//                
//                [self.allZipCodes addObject:zipCode];
//            }
//            
//        }
//        
//    }];
    
    
    //Bronx Zip Codes
    
    NSArray *bronxZipCodes = @[@"10451",
                               @"10452",
                               @"10453",
                               @"10454",
                               @"10455",
                               @"10456",
                               @"10457",
                               @"10458",
                               @"10459",
                               @"10460",
                               @"10461",
                               @"10462",
                               @"10463",
                               @"10464",
                               @"10465",
                               @"10466",
                               @"10467",
                               @"10468",
                               @"10469",
                               @"10470",
                               @"10471",
                               @"10472",
                               @"10473",
                               @"10474",
                               @"10475",
                               @"10499"
                               ];
    
    for (int i = 0; i < bronxZipCodes.count; i++) {
        ZipCode *zip = [[ZipCode alloc] init];
        zip.borough = @"Bronx";
        zip.number = bronxZipCodes[i];
        
        [self.allZipCodes addObject:zip];
    }
    
    NSLog(@"bronx zipcodes count: %ld",bronxZipCodes.count);

    
//    [ZipCodeAPIManager GETZipCodesWithCity:bronx state:ny CompletionHandler:^(id results) {
//        if ([results isKindOfClass:[NSDictionary class]]) {
//            
//            NSArray *zipCodes = results[@"zip_codes"];
//            
//            //NSLog(@"searchResults: %@", zipCodes);
//            
//            for (NSString *result in zipCodes){
//                
//                ZipCode *zipCode = [[ZipCode alloc] init];
//                zipCode.borough = bronx;
//                zipCode.number = result;
//                
//                [self.allZipCodes addObject:zipCode];
//                
//            }
//            
//        }
//        
//    }];
    
    NSLog(@"self.allZipCodes.count: %ld (ALL)", self.allZipCodes.count);
    
   
}

@end
