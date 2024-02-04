//
//  TimerDuration.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation

class TimerDurations: ObservableObject {
    
    init() {
        if checkIfFirstLaunch() {
            defaults.setValue(TimerDurations.defaultDurations, forKey: "durations")
            self.durations = TimerDurations.defaultDurations
        } else {
            self.durations = defaults.value(forKey: "durations") as? [Int] ?? TimerDurations.defaultDurations
        }
    }
    
    let defaults = UserDefaults.standard
    
    @Published var durations: [Int] = []
    
}



extension TimerDurations {
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

extension TimerDurations {
    static func saveDurationsToDefaults(_ durations: [Int]) {
        let defaults = UserDefaults.standard
        defaults.setValue(durations, forKey: "durations")
    }
}

extension TimerDurations {
    static let defaultDurations: [Int] = [5, 10, 15, 20 , 25, 30]
}
