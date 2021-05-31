//
//  WidgetLocationManager.swift
//  Stormer
//
//  Created by Milos Malovic on 31.5.21..
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class WidgetLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    var locationManager: CLLocationManager? {
           didSet {
               self.locationManager!.delegate = self
           }
       }

    private var handler: ((CLLocation) -> Void)?

    func fetchLocation(handler: @escaping (CLLocation) -> Void) {
        self.handler = handler
        self.locationManager?.requestLocation()

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler!(locations.last!)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("widget location fail with error \(error.localizedDescription)")
    }
}
