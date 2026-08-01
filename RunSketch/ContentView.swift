import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var isRunning = false
    @State private var showHistory = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Image(systemName: "figure.run")
                    .font(.system(size: 60))

                Text("RunSketch")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Turning every run into a visual story.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                Button("Start Run") {
                    locationManager.startRun()
                    isRunning = true
                }
                .buttonStyle(.borderedProminent)
                
                Button("Saved Activity") {
                    showHistory = true
                }
                .buttonStyle(.bordered)

            }
            .padding()
            .navigationDestination(isPresented: $isRunning) {
                RunningView(locationManager: locationManager)
            }
            
            .navigationDestination(isPresented: $showHistory) {
                RunHistoryView()
            }
        }
    }
}
#Preview {
    ContentView()
}
