//
//  TimerIntervalManager.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 05/02/2024.
//

import Foundation
class TimerIntervalManager: ObservableObject {
    
    init() {
        if checkIfFirstLaunch() {
            defaults.setValue(TimerIntervalManager.defaultHaptics, forKey: "haptics")
            defaults.setValue(TimerIntervalManager.defaultDurations, forKey: "durations")
            self.haptics = TimerIntervalManager.defaultHaptics
            self.durations = TimerIntervalManager.defaultDurations
        } else {
            self.haptics = defaults.value(forKey: "haptics") as? [Int] ?? TimerIntervalManager.defaultHaptics
            self.durations = defaults.value(forKey: "durations") as? [Int] ?? TimerIntervalManager.defaultDurations
        }
    }
    
    let defaults = UserDefaults.standard
    
    @Published var haptics: [Int] = []
    
    @Published var durations: [Int] = []
}

extension TimerIntervalManager {
    static let defaultHaptics: [Int] = [1, 3, 5, 10, 15 , 25, 30]
    static let defaultDurations: [Int] = [5, 10, 15, 20 , 25, 30]
}

extension TimerIntervalManager {
    func checkIfFirstLaunch() -> Bool {
        let ifFirstLaunch = defaults.value(forKey: "firstLaunch")
        if ifFirstLaunch != nil {
            return false
        } else {
            defaults.setValue(false, forKey: "firstLaunch")
            return true
        }
    }
}

extension TimerIntervalManager {
    static func saveIntervalsToDefaults(_ intervalType: IntervalType , _ intervals: [Int]) {
        let defaults = UserDefaults.standard
        defaults.setValue(intervals, forKey: intervalType.rawValue)
    }
}



