//
//  Run.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 21/7/2026.
//
import Foundation
import CoreLocation

enum RunState {
    case notStarted
    case running
    case paused
    case finished
}

struct Run {
    var startTime: Date
    var endTime: Date?
    var totalPausedTime: TimeInterval = 0
    var locations: [CLLocation]
    
    var distance: CLLocationDistance {
        if locations.count < 2 {
            return 0
        }
        
        var totalDistance: CLLocationDistance = 0
        
        for index in 1..<locations.count {
            
            let previousLocation = locations[index - 1]
            let currentLocation = locations[index]
            
            let distance = currentLocation.distance(from: previousLocation)
            
            totalDistance += distance
        }
        
        return totalDistance
    }
    var elapsedTime: TimeInterval {
        let currentTime = endTime ?? Date()
        return currentTime.timeIntervalSince(startTime) - totalPausedTime
        }
        
    
    
    var pace: Double {
        if distance == 0 {
            return 0
        }
        
        let minutes = elapsedTime/60
        let kilometres = distance/1000
        
        return minutes/kilometres
    }
    
}

