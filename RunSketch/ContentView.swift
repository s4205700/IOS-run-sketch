import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var isRunning = false

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

            }
            .padding()
            .navigationDestination(isPresented: $isRunning) {
                RunningView(locationManager: locationManager)
            }
        }
    }
}
#Preview {
    ContentView()
}
