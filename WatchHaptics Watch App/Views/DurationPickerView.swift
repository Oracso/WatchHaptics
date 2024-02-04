//
//  DurationPickerView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct DurationPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var totalDuration: Int
    @Binding var durations: [Int]
    func removeDuration(_ duration: Int) {
        durations.removeAll(where: {$0 == duration})
        TimerDurations.saveDurationsToDefaults(durations)
    }
    var body: some View {
        List {
            
            ForEach(durations, id: \.self) { duration in
                Button("\(duration)") {
                    totalDuration = duration
                    dismiss()
                }
             
                
                
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        removeDuration(duration)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                
            }
            
            
            
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    EditDurationsView(durations: $durations)
                } label: {
                    Text("Edit")
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        DurationPickerView(totalDuration: .createBinding(5), durations: .createBinding(TimerDurations.defaultDurations))
    }
}
