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
MKMapViewDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UILabel *zipCodeLabel;

@property (nonatomic) CLLocationManager *locationManager;

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

@end
