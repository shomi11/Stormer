//
//  StormerWidgetEntryView.swift
//  StormerWidgetExtension
//
//  Created by Milos Malovic on 31.5.21..
//

import SwiftUI

struct StormerWidgetEntryView: View {

    let entry: WidgetEntry

    var gradient = Gradient(colors: [Color.red, Color.orange, Color.yellow])

    var desc: ConditionsCodes? {
        return entry.weather.list?.first?.weather?.first?.main
    }

    var body: some View {
        VStack {
            ZStack {
                background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    icon(code: desc)
                        .resizable()
                        .scaledToFit()
                    Text(entry.weather.list?.first?.main?.currentTemp ?? "")
                        .font(.title)
                    HStack {
                        Text(entry.weather.list?.first?.main?.minimumTemp ?? "")
                        Spacer()
                        Text(entry.weather.list?.first?.main?.maximumTemp ?? "")
                    }.font(.caption2)
                    .padding()
                }.padding(.top, 8)
            }
        }
    }

    var background: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    private func icon(code: ConditionsCodes?) -> Image {
        switch code {
        case .Clear:
            return Image("Sunny")
        case .Clouds:
            return Image("Cloudy")
        case .Rain:
            return Image("Rainy")
        default:
            return Image("")
        }
    }
}

struct StormerWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        StormerWidgetEntryView(entry: WidgetEntry(date: Date(), weather: Weather.example))
    }
}
