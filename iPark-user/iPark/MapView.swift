//
//  MapView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/8/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import MapKit



struct MapView: UIViewRepresentable {
    
   func makeUIView(context: Context) -> MKMapView {
            MKMapView(frame: .zero)
        }

        func updateUIView(_ uiView: MKMapView, context: Context) {
            let coordinate = CLLocationCoordinate2D(
                latitude: 41.5895, longitude: -88.0578)
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
        }
    }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
