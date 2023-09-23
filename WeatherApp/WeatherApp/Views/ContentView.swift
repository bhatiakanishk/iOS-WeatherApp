//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kanishk Bhatia on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.64, saturation: 0.986, brightness: 0.489))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
