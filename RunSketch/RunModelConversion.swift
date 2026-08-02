import Foundation
import CoreLocation


extension Run {

    init(from model: RunModel) {

        self.startTime = model.startTime
        self.endTime = model.endTime
        self.totalPausedTime = 0
        
        self.locations = model.coordinates.map { coordinate in
            
            CLLocation(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        }
    }
}//
//  RunModelConversion.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 2/8/2026.
//

