//
//  RunningView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 23/7/2026.
//

import SwiftUI

struct RunningView: View {
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        VStack(spacing:20) {
            
            Text("Run in Progress")
                .font(.largeTitle)
            
            Text("Distance")
            
            Text("\(locationManager.currentDistance/1000) km")
            
            Text("Time")
            
            Text("\(Int(locationManager.elapsedTime)) seconds")
        }
    }
}

#Preview {
    RunningView(
        locationManager: LocationManager()
    )
}

