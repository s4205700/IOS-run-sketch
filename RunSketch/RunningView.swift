//
//  RunningView.swift
//  RunSketch
//

import SwiftUI
import SwiftData

struct RunningView: View {
    
    @ObservedObject var locationManager: LocationManager
    
    @State private var showSummary = false
    
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 30) {
                
                // Header
                
                VStack(spacing: 8) {
                    
                    Image(systemName: "figure.run")
                        .font(.system(size: 55))
                        .foregroundStyle(.blue)
                    
                    Text("Outdoor Run")
                        .font(.title2)
                        .bold()
                    
                    HStack {
                        Circle()
                            .fill(.red)
                            .frame(width: 10, height: 10)
                        
                        Text("Recording...")
                            .foregroundStyle(.secondary)
                    }
                }
                
                
                Spacer()
                
                
                // Main Timer
                
                VStack(spacing: 5) {
                    
                    Text(
                        Formatters.formatElapsedTime(
                            locationManager.currentRun?.elapsedTime ?? 0
                        )
                    )
                    .font(.system(size: 55, weight: .bold))
                    
                    Text("Elapsed Time")
                        .foregroundStyle(.secondary)
                }
                
                
                // Stats
                
                VStack(spacing: 15) {
                    
                    StatCard(
                        title: "Distance",
                        value: String(format: "%.2f km", locationManager.currentDistance / 1000),
                        icon: "location.fill"
                    )
                    
                    StatCard(
                        title: "Average Pace",
                        value: String(format: "%.2f km", locationManager.currentDistance / 1000),
                        icon: "bolt.fill"
                    )
                }
                
                
                Spacer()
                
                
                // Buttons
                
                VStack(spacing: 15) {
                    
                    if locationManager.runState == .running {
                        
                        Button {
                            locationManager.pauseRun()
                        } label: {
                            
                            Label(
                                "Pause Run",
                                systemImage: "pause.fill"
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle())
                        
                    }
                    
                    else if locationManager.runState == .paused {
                        
                        Button {
                            locationManager.resumeRun()
                        } label: {
                            
                            Label(
                                "Resume Run",
                                systemImage: "play.fill"
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle())
                        
                        
                        Button {
                            
                            locationManager.finishRun()
                            showSummary = true
                            
                        } label: {
                            
                            Label(
                                "Finish Run",
                                systemImage: "stop.fill"
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(SecondaryButtonStyle())
                    }
                }
            }
            .padding()
            .navigationDestination(isPresented: $showSummary) {
                
                if let run = locationManager.currentRun {
                    
                    RunSummaryView(run: run)
                }
            }
        }
    }
}



// MARK: - Stat Card

struct StatCard: View {
    
    let title: String
    let value: String
    let icon: String
    
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 35)
            
            VStack(alignment: .leading) {
                
                Text(value)
                    .font(.title2)
                    .bold()
                
                Text(title)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}






#Preview {
    RunningView(
        locationManager: LocationManager()
    )
}
