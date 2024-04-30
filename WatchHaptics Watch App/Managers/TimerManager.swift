//
//  TimerManager.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timer: Timer?
    
    @Published var totalDuration = 0
    
    @Published var secondsRemaining = 0
    
    @Published var timerActive = false
    
    @Published var continuous = false
    
    @Published var hapticInterval = 0
    
}


// MARK: - Timer Functionality

extension TimerManager {
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
    }
    
    func startTimer() {
        if continuous {
            timerActive = true
            initTimer()
        } else {
            if secondsRemaining != 0 {
                if secondsRemaining == totalDuration {
                    timer?.invalidate()
                    secondsRemaining = totalDuration
                    timerActive = true
                    initTimer()
                } else {
                    initTimer()
                }
            }
        }
    }
    
    @objc func fireTimer() {
        if continuous {
            self.secondsRemaining += 1
            checkIfHapticFactor()
        } else {
            self.secondsRemaining -= 1
            checkIfHapticFactor()
            if self.secondsRemaining == 0 {
                self.stopTimer()
            }
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

// MARK: - Haptics

extension TimerManager {
    func vibrate() {
//        WKInterfaceDevice.current().play(.notification)
        WKInterfaceDevice.current().play(.success)
    }
    
    func checkIfHapticFactor() {
        if continuous {
            if secondsRemaining.isMultiple(of: hapticInterval) {
                vibrate()
            }
        } else {
            if (totalDuration - secondsRemaining).isMultiple(of: hapticInterval) {
                vibrate()
            }
        }
    }
    
}


