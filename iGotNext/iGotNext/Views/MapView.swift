//
//  Map.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var annotations:[Location] = []
    @StateObject private var viewModel = LocationViewModel()
    var body: some View {
        VStack{
            Map(coordinateRegion: $viewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: annotations)
            {item in
                MapPin(coordinate: item.coordinate)
            }
            .accentColor(.pink)
            .onAppear{
                viewModel.checkIfLocationServicesISEnabled()
            }
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
