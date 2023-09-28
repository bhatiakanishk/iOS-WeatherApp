//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kanishk Bhatia on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    Text("Weather Data fetched")
                } else {
                    LoadingView()
                        .task {
                            do{
                                try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
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
