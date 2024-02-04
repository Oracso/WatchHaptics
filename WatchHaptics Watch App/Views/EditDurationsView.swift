//
//  EditDurationsView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct EditDurationsView: View {
    @Binding var durations: [Int]
    @State private var newDuration: Int = 1
    func saveNewDuration() {
        durations.append(newDuration)
        TimerDurations.saveDurationsToDefaults(durations)
    }
    var body: some View {
        
        VStack {
            
            Picker("New Duration", selection: $newDuration) {
                ForEach(1..<100, id: \.self) {
                    Text(String($0))
                }
            }
            
            Button("Reset All Durations") {
                TimerDurations.saveDurationsToDefaults(TimerDurations.defaultDurations)
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    saveNewDuration()
                }
            }
        }
        
        
    }
}

#Preview {
    NavigationStack {
        EditDurationsView(durations: .createBinding(TimerDurations.defaultDurations))
    }
}
