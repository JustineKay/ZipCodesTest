//
//  ViewController.m
//  ZipCodes
//
//  Created by Justine Gartner on 11/27/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

@interface ViewController ()
<
CLLocationManagerDelegate,
MKMapViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UILabel *zipCodeLabel;

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *zipCodeCoordinates;
@property (nonatomic) NSInteger latitude;
@property (nonatomic) NSInteger longitude;
@property (nonatomic) NSMutableArray *locations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLocationUpdates];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    self.mapView.showsCompass = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    self.latitude = self.latitudeTextField.text.integerValue;
    self.longitude = self.longitudeTextField.text.integerValue;
    
    [self startLocationUpdates];
    
    return YES;
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
    //    CLLocation *currentLocation;
    //    currentLocation = [locations objectAtIndex:0];
    //    [self.locationManager stopUpdatingLocation];
    
    for (CLLocation *newLocation in locations) {
        
//        if (self.locations == nil) {
//            
//            self.locations = [NSMutableArray array];
//        }
//        
//        [self.locations addObject:newLocation];
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (!(error))
             {
                 CLPlacemark *placemark = [placemarks objectAtIndex:0];
                 NSLog(@"\nCurrent Location Detected\n");
                 NSLog(@"placemark %@",placemark);
                 //             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                 //
                 //             NSString *Address = [[NSString alloc]initWithString:locatedAt];
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
