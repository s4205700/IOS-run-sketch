import SwiftUI
import CoreLocation


struct RunSummaryView: View {
    let run: Run
    
    var convertedCoordinates: [Coordinate] {

        let coordinates = run.locations.map { location in

            Coordinate(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
            
        }
        print("Summary coordinates:", coordinates.count)

        return coordinates
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            RouteMapView(
                coordinates: convertedCoordinates
            )
            
            .frame(maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text("RUN STATS")
                .font(.largeTitle)
                .bold()
            
            Text("Distance")
            Text("\(run.distance / 1000, specifier: "%.2f") km")
            
            Text("Time")
            Text("\(Int(run.elapsedTime / 60)) minutes")
            
            Text("Avg Pace")
            Text("\(run.pace, specifier: "%.2f") min/km")
            
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    RunSummaryView(
        run: Run(
            startTime: Date(),
            endTime: Date(),
            locations: []
        )
    )
}//
//  RunSummaryView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 27/7/2026.
//

