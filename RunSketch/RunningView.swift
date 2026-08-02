//
//  RunningView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 23/7/2026.
//
import SwiftData
import SwiftUI
import _LocationEssentials

struct RunningView: View {
    @ObservedObject var locationManager: LocationManager
    @State private var showSummary = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Run in Progress")
                    .font(.largeTitle)
                
                Text("Distance")
                Text("\(locationManager.currentDistance / 1000, specifier: "%.2f") km")
                
                Text("Time")
                Text("\(Int(locationManager.currentRun?.elapsedTime ?? 0)) seconds")
                
                
                if locationManager.runState == .running {
                    
                    Button("Pause Run") {
                        locationManager.pauseRun()
                    }
                    .buttonStyle(.borderedProminent)
                    
                } else if locationManager.runState == .paused {
                    
                    Button("Resume Run") {
                        locationManager.resumeRun()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                    Button("Finish Run") {
                        locationManager.finishRun()
                        saveRun()
                        showSummary = true
                    }
                    .buttonStyle(.bordered)
                }
            }
            .navigationDestination(isPresented: $showSummary) {
                if let run = locationManager.currentRun {
                    RunSummaryView(run: run)
                }
            }
        }
    }
    func saveRun() {
        
        guard let run = locationManager.currentRun else {
            return
        }
        var coordinates: [Coordinate] = []
        
        for location in run.locations {
            
            let coordinate = Coordinate(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
            
            coordinates.append(coordinate)
        }
        
        let savedRun = RunModel(
            startTime: run.startTime,
            endTime: run.endTime ?? Date(),
            distance: run.distance,
            elapsedTime: run.elapsedTime,
            pace: run.pace
        )
        
        savedRun.coordinates = coordinates
        
        print("Saved run coordinates count:", savedRun.coordinates.count)
        
        modelContext.insert(savedRun)
        
        try? modelContext.save()
    }}

#Preview {
    RunningView(
        locationManager: LocationManager()
    )
}
