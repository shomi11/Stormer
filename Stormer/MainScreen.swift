//
//  MainScreen.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import SwiftUI
import CoreLocation

struct MainScreen: View {

    @StateObject var locationManager = LocationManager()
    @State private var weather: Weather = Weather.initial

    init() {
                let navBarAppearance = UINavigationBar.appearance()
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
              }    

    var body: some View {
        NavigationView {
            ZStack {
                background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    TopScreenView(baseWeather: weather.list?.first ?? BaseWeather.initial)
                }
            }.navigationTitle(weather.locationName)
        }
        .onReceive(locationManager.$location, perform: { _ in
            getBaseForecast()
        })
        .onReceive(locationManager.$authorizationStatus, perform: { status in
            switch status {
            case .authorizedAlways:
                locationManager.updateLocation()
            case .authorizedWhenInUse:
                locationManager.updateLocation()
            default:
                break
            }
        })
    }

    var background: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

private extension MainScreen {

    func getBaseForecast() {
        guard let location = locationManager.location else { return }
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        let coord = Coord(lon: lon, lat: lat)
        ApiService.shared.request(type: Weather.self, router: Router.getForecasts(coordinated: coord)) { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                locationManager.stopUpdatingLocation()
            case .failure(let err):
                print("error \(err)")
            }
        }
    }
}
