//
//  ContentView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 13/7/2026.
//

import SwiftUI

struct ContentView: View {
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
                
            }
            
            Button(isRunning ? "Stop Run" : "Start Run") {
                isRunning.toggle()
                
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
