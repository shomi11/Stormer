//
//  StormerWidget.swift
//  StormerWidget
//
//  Created by Milos Malovic on 31.5.21..
//

import WidgetKit
import SwiftUI

@main
struct StormerWidget: Widget {
    let kind: String = "StormerWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetTimeline(), content: { entry in
            StormerWidgetEntryView(entry: entry)
        })
        .configurationDisplayName("Stormer Widget")
        .description("This is an example widget.")
    }
}
