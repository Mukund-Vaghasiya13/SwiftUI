//
//  ContentView.swift
//  MapAnotaion
//
//  Created by Mukund vaghasiya  on 30/06/23.
//

import SwiftUI
import MapKit

struct place:Identifiable{
    var id = UUID()
    var codinate:CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var center  = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.6708, longitude: 71.5724), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        ZStack {
            Map(coordinateRegion: $center, annotationItems:[place(codinate: CLLocationCoordinate2D(latitude: 22.6708, longitude:  71.5724))] ) { p in
                MapAnnotation(coordinate: p.codinate) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .foregroundColor(Color.red)
                        
                }
            }.ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
