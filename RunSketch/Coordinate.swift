import Foundation
import SwiftData

@Model
class Coordinate {

    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}//
//  Coordinate.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 1/8/2026.
//

