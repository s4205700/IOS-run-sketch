import SwiftUI

struct RunSummaryView: View {
    let run: Run
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Run Complete")
                .font(.largeTitle)
                .bold()
            
            Text("Distance")
            Text("\(run.distance / 1000, specifier: "%.2f") km")
            
            Text("Time")
            Text("\(Int(run.elapsedTime / 60)) minutes")
            
            Text("Pace")
            Text("\(run.pace, specifier: "%.2f") min/km")
            
        }
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

