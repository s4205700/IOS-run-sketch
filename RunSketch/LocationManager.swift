// The responsibilities of this specific file are to ask the user for permission, start location tracking and recieve locations.//
import Combine
import CoreLocation
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var currentRun: Run?
    @Published var locationCount = 0
    @Published var currentDistance: CLLocationDistance = 0
    @Published var elapsedTime: TimeInterval = 0
    private var timer: Timer?
    
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
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            if let run = self.currentRun {
                self.elapsedTime = run.elapsedTime
            }
        }
    }
    
    func stopRun() {
        currentRun?.endTime = Date()
        
        locationManager.stopUpdatingLocation()
        
        timer?.invalidate()
        timer = nil
    }
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let latestLocation = locations.last else {
            return 
        }
        currentRun?.locations.append(latestLocation)
        locationCount = currentRun?.locations.count ?? 0
        currentDistance = currentRun?.distance ?? 0
        
    }
    
    
    
}
//  LocationManager.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 14/7/2026.
//
