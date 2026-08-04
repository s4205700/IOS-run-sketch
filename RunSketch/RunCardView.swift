//
//  RunCardView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 1/8/2026.
//
import SwiftUI

struct RunCardView: View {
    
    let run: RunModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text(run.startTime, style: .date)
                .font(.headline)
            
            Text(run.startTime, style: .time)
                .foregroundStyle(.secondary)
            
            Divider()
            
            Text("\(run.distance / 1000, specifier: "%.2f") km")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(
                    Formatters.formatElapsedTime(run.elapsedTime)
                )
                
                Spacer()
                
                Text("\(run.pace, specifier: "%.2f") /km")
            }
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

