import SwiftUI

struct ContentView: View {

    @StateObject private var locationManager = LocationManager()

    var body: some View {

        NavigationStack {

            VStack(spacing: 25) {

                Image(systemName: "figure.run")
                    .font(.system(size: 60))

                Text("HOPPA")
                    .font(.largeTitle)
                    .bold()

                NavigationLink {

                    RecordRunView(
                        locationManager: locationManager
                    )

                } label: {

                    Label("Record Activity", systemImage: "record.circle.fill")
                        .frame(maxWidth: .infinity)

                }
                .buttonStyle(.borderedProminent)

                NavigationLink {

                    RunHistoryView()

                } label: {

                    Label("Previous Runs", systemImage: "clock.arrow.circlepath")
                        .frame(maxWidth: .infinity)

                }
                .buttonStyle(.bordered)

            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
