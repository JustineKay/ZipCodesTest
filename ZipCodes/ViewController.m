//
//  ViewController.m
//  ZipCodes
//
//  Created by Justine Gartner on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"
#import "ZipCodeAPIManager.h"
#import "ZipCode.h"
#import "ZipCodeData.h"

@interface ViewController ()
<
CLLocationManagerDelegate,
MKMapViewDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *zipCodeLabel;

@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic) NSMutableArray *locations;
@property (nonatomic) NSMutableArray *zipCodesOfNYC;

@property (nonatomic) ZipCodeData *zipCodeData;

@property (nonatomic) BOOL isNYC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLocationUpdates];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.showsCompass = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    if (self.zipCodeData == nil) {
        
        self.zipCodeData = [[ZipCodeData alloc] init];
        [self.zipCodeData initializeData];
        
    }
    
}

- (IBAction)trackLocationButtonTapped:(UIButton *)sender {
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    [self startLocationUpdates];
}

- (void)startLocationUpdates {
    
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    [self.locationManager requestAlwaysAuthorization];
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.activityType = CLActivityTypeFitness;
    
    // Movement threshold for new events.
    self.locationManager.distanceFilter = 10; // meters
    
    self.locationManager.allowsBackgroundLocationUpdates = YES;
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    for (CLLocation *newLocation in locations) {
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (!(error))
             {
                 CLPlacemark *placemark = [placemarks objectAtIndex:0];
                 NSLog(@"\nCurrent Location Detected\n");
                 NSLog(@"placemark %@",placemark);
                
                 NSString *userLocationZipCode = [[NSString alloc]initWithString:placemark.postalCode];
                 NSLog(@"%@",userLocationZipCode);
                 self.zipCodeLabel.text = userLocationZipCode;
                 
                 [self verifyZipCode:userLocationZipCode];
             }
             else
             {
                 NSLog(@"Geocode failed with error %@", error); // Error handling must required
             }
         }];
    }
}

-(void)verifyZipCode: (NSString *)userLocationZipCode{
    
    
    for (ZipCode *zip in self.zipCodeData.allZipCodes){
        
        if ([zip.number isEqualToString:userLocationZipCode]) {
            
            NSLog(@"User is in NYC, %@", zip.borough);
            
            
            //For SeekNYC calculations
            
            //Accummulate a count for each borough
            if ([zip.borough isEqualToString:@"Brooklyn"]) {
                //ADD to percentag of BK uncovered
            }else if ([zip.borough isEqualToString:@"Manhattan"]){
                
                //Add to percentageOfMANUncovered
            }else if ([zip.borough isEqualToString:@"Staten Island"]){
                
                //add to percentageOfSIUncovered
            }else if ([zip.borough isEqualToString:@"Bronx"]) {
                
                //add to percentageOfBRXUncovered
            }else if ([zip.borough isEqualToString:@"Queens"]){
                
                //add to percentageOfQNSUncovered
            }
                
            
            self.isNYC = YES;
            
        }else {
            
            NSLog(@"User is not in NYC");
            
            self.isNYC = NO;
            
            break;
        }
        
    }
    
    NSLog(@"self.zipCodeData.allZipcodes: %@", self.zipCodeData.allZipCodes);
    
}

@end
