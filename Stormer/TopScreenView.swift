//
//  TopScreenView.swift
//  Stormer
//
//  Created by Milos Malovic on 31.5.21..
//

import SwiftUI

struct TopScreenView: View {

    let baseWeather: BaseWeather

    var weatherDesc: WeatherDesc? {
        return baseWeather.weather?.first
    }

    var body: some View {
        VStack(spacing: 16) {
            icon(code: weatherDesc?.main)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
            Text("\(baseWeather.main?.currentTemp ?? "")")
                .font(.system(size: 60, weight: .semibold, design: .default))
                .foregroundColor(.white)
            bottomStack
        }
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

    var bottomStack: some View {
        HStack(spacing: 16) {
            Text(baseWeather.main?.minimumTemp ?? "")
            Text(baseWeather.main?.maximumTemp ?? "")
        }.foregroundColor(.blue)
    }
}

struct TopScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TopScreenView(baseWeather: BaseWeather.example)
    }
}
