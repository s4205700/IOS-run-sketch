//
//  RouteMapView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 1/8/2026.
//

import SwiftUI
import MapKit

struct RouteMapView: View {
    
    let coordinates: [Coordinate]
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    
    var mapCoordinates: [CLLocationCoordinate2D] {
        
        coordinates.map { coordinate in
            
            CLLocationCoordinate2D(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        }
    }
    
    
    var body: some View {
        
        Map(position: $cameraPosition) {
            
            if mapCoordinates.count > 1 {
                
                MapPolyline(coordinates: mapCoordinates)
                    .stroke(.orange, lineWidth: 5)
            }
        }
        .onAppear {
            setCamera()
        }
    }
    
    
    func setCamera() {
        
        guard let firstCoordinate = mapCoordinates.first else {
            return
        }
        
        let region = MKCoordinateRegion(
            center: firstCoordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
        
        cameraPosition = .region(region)
    }
}

#Preview {
    RouteMapView(
        coordinates: []
    )
}



//
//  RouteMapView.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 1/8/2026.
//

