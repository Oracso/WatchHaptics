//
//  ContinuousTimerView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct ContinuousTimerView: View {
    @StateObject var timerManager = TimerManager()
    @StateObject var timerIntervalManager = TimerIntervalManager()
    @State private var firstViewLoad = true
    var body: some View {
        ScrollView {
            
            Text("\(timerManager.secondsRemaining)")
                .font(.system(size: 30))
            
            HStack {
                
                Button(timerManager.timerActive ? "Stop" : "Start") {
                    if timerManager.timerActive {
                        timerManager.stopTimer()
                    } else {
                        timerManager.startTimer()
                    }
                }
                
                Button("Reset") {
                    timerManager.resetTimer()
                }
                
            }
            
            NavigationLink {
                IntervalPickerView(selectedInterval: $timerManager.hapticInterval, intervals: $timerIntervalManager.haptics, intervalType: .haptics)
            } label: {
                VStack {
                    Text("Haptic Interval")
                    Text("\(timerManager.hapticInterval)")
                }
            }
            
        }
        .padding(.top, 60)
        .padding(.bottom, 20)
        .ignoresSafeArea(.all)
        
        .onAppear() {
            if firstViewLoad {
                timerManager.continuous = true
                timerManager.hapticInterval = timerIntervalManager.haptics.sorted()[0]
                firstViewLoad = false
            }
        }
        
        .onDisappear() {
            timerManager.stopTimer()
        }
        
    }
}

#Preview {
    NavigationStack {
        ContinuousTimerView()
    }
}
