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
            WelcomeView().environmentObject(locationManager)
        }
        .background(Color(hue: 0.64, saturation: 0.986, brightness: 0.489))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
