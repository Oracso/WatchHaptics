//
//  IntervalPickerView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 05/02/2024.
//

import SwiftUI

struct IntervalPickerView: View {
    @Environment(\.dismiss) private var dismiss
    var selectedInterval: Binding<Int>?
    @Binding var intervals: [Int]
    let intervalType: IntervalType
    func removeInterval(_ interval: Int) {
        intervals.removeAll(where: {$0 == interval})
        TimerIntervalManager.saveIntervalsToDefaults(intervalType, intervals)
    }
    var body: some View {
        List {
            
            ForEach(intervals.sorted(), id: \.self) { interval in
                Button("\(interval)") {
                    if let selectedInterval {
                        selectedInterval.wrappedValue = interval
                        dismiss()
                    }
                }
                
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        removeInterval(interval)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EditIntervalView(intervals: $intervals, intervalType: intervalType)
                    } label: {
                        Text("Edit")
                            .foregroundStyle(.white)
                    }
                    
                }
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        IntervalPickerView(intervals: .createBinding(TimerIntervalManager.defaultHaptics), intervalType: .haptics)
//        IntervalPickerView(totalDuration: .createBinding(10), intervals: .createBinding(TimerIntervalManager.defaultHaptics), intervalType: .haptics)
    }
}
