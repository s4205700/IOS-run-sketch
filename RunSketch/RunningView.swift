//
//  RunningView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 23/7/2026.
//
import SwiftData
import SwiftUI

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
                        showSummary = true
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

        let savedRun = RunModel(
            startTime: run.startTime,
            endTime: run.endTime ?? Date(),
            distance: run.distance,
            elapsedTime: run.elapsedTime,
            pace: run.pace
        )

        modelContext.insert(savedRun)
    }}

#Preview {
    RunningView(
        locationManager: LocationManager()
    )
}
