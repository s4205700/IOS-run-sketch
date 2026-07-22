//
//  ContentView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 13/7/2026.
//
import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var isRunning = false

    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "figure.run")
                .font(.system(size: 60))
            
            Text("RunSketch")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Turning every run into a visual story.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            
            if isRunning {
                Text("Run in Progress!!")
                Text("GPS Points: \(locationManager.locationCount)")
                
            }
            
            Button(isRunning ? "Stop Run" : "Start Run") {
                if isRunning {
                    isRunning = false
                } else {
                    locationManager.startRun()
                    isRunning = true
                }
                
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
