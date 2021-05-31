//
//  WidgetTimeline.swift
//  Stormer
//
//  Created by Milos Malovic on 31.5.21..
//

import Foundation
import WidgetKit
import SwiftUI
import CoreLocation

struct WidgetTimeline: TimelineProvider {

    typealias Entry = WidgetEntry
    let locationManager = WidgetLocationManager()

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: Date(), weather: Weather.initial)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        let date = Date()
        let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: date)
        if locationManager.locationManager == nil {
            locationManager.locationManager = CLLocationManager()
        }
        locationManager.fetchLocation { location in
            print("here is location \(location)")
            ApiService.shared.request(type: Weather.self, router: Router.getForecasts(coordinated: Coord(lon: location.coordinate.longitude, lat: location.coordinate.latitude))) { result in
                switch result {
                case .success(let weather):
                    let entry = WidgetEntry(date: date, weather: weather)
                    let timeline = Timeline(entries: [entry], policy: .after(refreshDate ?? Date()))
                    completion(timeline)
                case .failure(let err):
                    let entry = WidgetEntry(date: date, weather: Weather.example)
                    let timeline = Timeline(entries: [entry], policy: .after(refreshDate ?? Date()))
                    completion(timeline)
                    print("error \(err.localizedDescription)")
                }
            }
        }
    }

    func placeholder(in context: Context) -> WidgetEntry {
        let entry = WidgetEntry(date: Date(), weather: Weather.initial)
        return entry
    }

}
