//
//  ContentView.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerManager = TimerManager()
    @StateObject var timerDurations = TimerDurations()
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                Text("\(timerManager.secondsRemaining)")
//                    .padding(.top, 40)
                
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
                    DurationPickerView(totalDuration: $timerManager.totalDuration, durations: $timerDurations.durations)
                } label: {
                    VStack {
                        Text("Duration")
                        Text("\(timerManager.totalDuration)")
                        
                    }
                }
                
                //            Picker("Duration", selection: $timerManager.totalDuration) {
                //                ForEach(timerDurations.durations, id: \.self) {
                //                    Text(String($0))
                //                }
                //            }
                .pickerStyle(.navigationLink)
            }
        }
        .ignoresSafeArea(.all)
        
        .onAppear() {
            timerManager.secondsRemaining = timerDurations.durations[0]
            timerManager.totalDuration = timerManager.secondsRemaining
        }
        
        .onChange(of: timerManager.totalDuration) { oldValue, newValue in
            timerManager.secondsRemaining = timerManager.totalDuration
        }
        
    }
}

#Preview {
    ContentView()
}
