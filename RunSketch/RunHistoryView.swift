import SwiftUI
import SwiftData

struct RunHistoryView: View {
    
    @Query private var runs: [RunModel]
    
    var body: some View {
        VStack {
            
            Text("Previous Runs")
                .font(.largeTitle)
            
            List(runs) { run in
                
                RunCardView(run: run)
                    
                    Text("\(run.distance / 1000, specifier: "%.2f") km")
                    
                    Text("\(Int(run.elapsedTime / 60)) minutes")
                    
                    Text("\(run.pace, specifier: "%.2f") min/km")
                
            }
        }
    }
}

#Preview {
    RunHistoryView()
        .modelContainer(for: RunModel.self, inMemory: true)
}
//  RunHistoryView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 28/7/2026.
//

