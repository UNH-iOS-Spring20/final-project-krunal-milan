    //
//  GetDirections.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/8/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import MapKit

struct GetDirections: View {
    var body: some View {
        mapView()
    }
}
    
    struct mapView: UIViewRepresentable {
        
        func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
            let map = MKMapView()
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707), latitudinalMeters: 100000, longitudinalMeters: 100000)
            map.region = region
            return map
        }
        
        func updateUIView(_ uiView: MKMapView, context:  UIViewRepresentableContext<mapView>) {
            
        }
    }

struct GetDirections_Previews: PreviewProvider {
    static var previews: some View {
        GetDirections()
    }
}
