import SwiftUI
import SwiftData

struct RunHistoryView: View {
    
    @Query(sort: \RunModel.startTime, order: .reverse)
    private var runs: [RunModel]
    
    var body: some View {
        VStack {
            
            Text("Previous Runs")
                .font(.largeTitle)
            
            List(runs) { run in
                
                NavigationLink{
                    RunSummaryView(
                        run: Run(from: run)
                    )
                }label: {
                    RunCardView(run: run)
                }
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

