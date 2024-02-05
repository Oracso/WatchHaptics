//
//  EditIntervalView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 05/02/2024.
//

import SwiftUI

struct EditIntervalView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var intervals: [Int]
    @State private var newInterval: Int = 1
    let intervalType: IntervalType
    func saveNewInterval() {
        if intervals.contains(where: {$0 == newInterval}) == false {
            intervals.append(newInterval)
            TimerIntervalManager.saveIntervalsToDefaults(intervalType, intervals)
        }
    }
    var body: some View {
        VStack {
            
            Picker("New Duration", selection: $newInterval) {
                ForEach(1..<100, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(.navigationLink)
            
            Button("Reset All \(intervalType.rawValue.capitalized)") {
                let defaultIntervals: [Int]
                switch intervalType {
                case .haptics:
                    defaultIntervals = TimerIntervalManager.defaultHaptics
                case .durations:
                    defaultIntervals = TimerIntervalManager.defaultDurations
                }
                intervals = defaultIntervals
                TimerIntervalManager.saveIntervalsToDefaults(intervalType, defaultIntervals)
                dismiss()
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNewInterval()
                    dismiss()
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditIntervalView(intervals: .createBinding(TimerIntervalManager.defaultDurations), intervalType: .durations)
    }
}
