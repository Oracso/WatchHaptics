//
//  TimerSelectionView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct TimerSelectionView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                ContinuousTimerView()
            } label: {
                Text("Continuous")
            }
            
            NavigationLink {
                CountdownTimerView()
            } label: {
                Text("Countdown")
            }

            .navigationTitle("Timers")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    TimerSelectionView()
}
