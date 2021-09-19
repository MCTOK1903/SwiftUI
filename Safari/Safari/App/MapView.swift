//
//  MapView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI
import MapKit

struct MapView: View {

    // MARK: - Properties

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        )
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0
        )
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapZoomLevel
        )
        return mapRegion
    }()

    let locations: [NationalParkLocation]  = Bundle.main.decode("locations.json")


    // MARK: - Body

    var body: some View {

        Map(coordinateRegion: $region, annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .overlay(
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 48,
                        height: 48,
                        alignment: .center
                )

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Latitude:")
                            .foregroundColor(.accentColor)
                            .font(.footnote)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                    } //: HStack

                    HStack {
                        Text("Longitude:")
                            .foregroundColor(.accentColor)
                            .font(.footnote)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                    } //: HStack
                } //: VStack
            }  //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
