import SwiftUI
import CoreLocation
import SwiftData


struct RunSummaryView: View {
    let run: Run
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
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
    func saveRun() {

        var coordinates: [Coordinate] = []

        for location in run.locations {

            coordinates.append(
                Coordinate(
                    latitude: location.coordinate.latitude,
                    longitude: location.coordinate.longitude
                )
            )
        }

        let savedRun = RunModel(
            startTime: run.startTime,
            endTime: run.endTime ?? Date(),
            distance: run.distance,
            elapsedTime: run.elapsedTime,
            pace: run.pace,
            coordinates: coordinates
        )

        modelContext.insert(savedRun)

        dismiss()
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            RouteMapView(
                coordinates: convertedCoordinates
            )
            
            .frame(maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text("Activity Summary")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)


                StatCard(
                    title: "Distance",
                    value: String(format: "%.2f km", run.distance / 1000),
                    icon: "location.fill"
                )


                StatCard(
                    title: "Duration",
                    value: Formatters.formatElapsedTime(run.elapsedTime),
                    icon: "clock.fill"
                )


                StatCard(
                    title: "Average Pace",
                    value: String(format: "%.2f min/km", run.pace),
                    icon: "figure.run"
                )
            
            Spacer()

            Button {

                saveRun()

            } label: {

                Label(
                    "Save Activity",
                    systemImage: "square.and.arrow.down.fill"
                )
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(MainButtonStyle())


            Button(role: .destructive) {

                dismiss()

            } label: {

                Label(
                    "Discard Activity",
                    systemImage: "trash"
                )
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(SecondaryButtonStyle())
            
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

