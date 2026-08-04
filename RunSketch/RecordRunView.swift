//
//  RecordRunView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 3/8/2026.
//

import SwiftUI

struct RecordRunView: View {

    @ObservedObject var locationManager: LocationManager

    @State private var isRunning = false

    var body: some View {

        VStack(spacing: 30) {

            Image(systemName: "figure.run")
                .font(.system(size: 80))

            Text("Outdoor Run")
                .font(.largeTitle)
                .bold()

            Text("Ready to record your activity?")
                .foregroundStyle(.secondary)

            Button("Start Run") {

                locationManager.startRun()
                isRunning = true

            }
            .buttonStyle(.borderedProminent)

        }
        .navigationDestination(isPresented: $isRunning) {

            RunningView(locationManager: locationManager)

        }
    }
}

#Preview {
    RecordRunView(
        locationManager: LocationManager()
    )
}
