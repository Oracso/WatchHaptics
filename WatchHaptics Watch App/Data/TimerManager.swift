//
//  TimerManager.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation

class TimerManager: ObservableObject {
    
    @Published var timer: Timer?
    
    @Published var totalDuration = 0
    
    @Published var secondsRemaining = 0
    
    @Published var timerActive = false
    //    @Published var timerProgress: Double {
    //        get {
    //            Double(secondsRemaining) / Double(totalDuration)
    //        }
    //        set {  }
    //    }
    
}

// MARK: - Timer Functionality
extension TimerManager {
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    func startTimer() {
        if secondsRemaining == totalDuration {
            timer?.invalidate()
            secondsRemaining = totalDuration
            timerActive = true
            initTimer()
        } else {
            initTimer()
        }
        
    }
    
    @objc func fireTimer() {
        self.secondsRemaining -= 1
        
        if self.secondsRemaining == 0 {
            self.stopTimer()
            
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timerActive = false
    }
    
    func resetTimer() {
        stopTimer()
        secondsRemaining = totalDuration
    }
    
}
