import Foundation
import SwiftData

@Model
class RunModel {

    var startTime: Date
    var endTime: Date
    var distance: Double
    var elapsedTime: Double
    var pace: Double
    var coordinates: [Coordinate] = []

    init(
        startTime: Date,
        endTime: Date,
        distance: Double,
        elapsedTime: Double,
        pace: Double,
    ) {
        self.startTime = startTime
        self.endTime = endTime
        self.distance = distance
        self.elapsedTime = elapsedTime
        self.pace = pace
    }
}//
//  RunModel.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 28/7/2026.
//

