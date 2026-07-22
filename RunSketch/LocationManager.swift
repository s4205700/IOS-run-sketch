// The responsibilities of this specific file are to ask the user for permission, start location tracking and recieve locations.//
import Combine
import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var currentRun: Run?
    @Published var locationCount = 0
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func startRun() {
        currentRun = Run(
            startTime: Date(),
            endTime: nil,
            locations: []
            
        )
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(
        _manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        let latestLocation = locations.last!
        currentRun?.locations.append(latestLocation)
        locationCount = currentRun?.locations.count ?? 0
        
    }
    
    
    
}
//  LocationManager.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 14/7/2026.
//
