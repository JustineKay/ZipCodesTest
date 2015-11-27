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
#import "ZipCodesAPIResult.h"

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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLocationUpdates];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.showsCompass = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    NSString *brooklyn = @"Brooklyn";
    NSString *ny = @"NY";
    
    [ZipCodeAPIManager GETZipCodesWithCity:brooklyn state:ny CompletionHandler:^(id results) {
        
        if ([results isKindOfClass:[NSDictionary class]]) {
            
            self.zipCodesOfNYC = [[NSMutableArray alloc]init];
            
            //NSLog(@"zipcodes: %@", results);
            
            NSArray *zipCodes = results[@"zip_codes"];
            
            //NSLog(@"searchResults: %@", zipCodes);
            
            for (NSString *result in zipCodes){
                
                ZipCodesAPIResult *zipCode = [[ZipCodesAPIResult alloc] initWithJSON:results];
                zipCode.borough = brooklyn;
                zipCode.zipCode = result;
                
                
                [self.zipCodesOfNYC addObject:zipCode];
                
                NSLog(@"self.zipcodesOfNYC: %@", self.zipCodesOfNYC);
            }
        }
    }];
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
                
                 NSString *zipCode = [[NSString alloc]initWithString:placemark.postalCode];
                 NSLog(@"%@",zipCode);
                 self.zipCodeLabel.text = zipCode;
             }
             else
             {
                 NSLog(@"Geocode failed with error %@", error); // Error handling must required
             }
         }];
    }
}

@end
