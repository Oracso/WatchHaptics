//
//  SettingsView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 05/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var timerIntervalManager = TimerIntervalManager()
    var body: some View {
        List {
            NavigationLink {
                IntervalPickerView(intervals: $timerIntervalManager.durations, intervalType: .durations)
            } label: {
                Text("Timer Durations")
            }

            NavigationLink {
                IntervalPickerView(intervals: $timerIntervalManager.haptics, intervalType: .haptics)
            } label: {
                Text("Timer Intervals")
            }
            
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
