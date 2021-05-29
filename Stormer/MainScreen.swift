//
//  MainScreen.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import SwiftUI
import Combine
import CoreLocation

struct MainScreen: View {

    @StateObject var locationManager = LocationManager()

    var locationCancellable = [AnyCancellable]()

    var body: some View {
        NavigationView {
            VStack {
              Text("Your location is:")
              HStack {
                Text("Latitude: \(Double(locationManager.location?.coordinate.latitude ?? 0))")
              }
            }
        }.onReceive(locationManager.$location, perform: { _ in
            getBaseForecast()
        })
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
        ApiService.shared.request(type: BaseWeather.self, router: Router.getForecasts(coordinated: coord)) { result in
            switch result {
            case .success(let baseWeather):
                print("success \(baseWeather.name)")
            case .failure(let err):
                print("error \(err)")
            }
        }
    }
}
