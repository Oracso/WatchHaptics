//
//  Extensions.swift
//  WatchHaptics Watch App
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

// MARK: - Create Binding
extension Binding {
    static func createBinding(_ value: Value) -> Binding<Value> {
        var bindingValue = value
        return Binding(
            get: { bindingValue },
            set: { newValue in
                bindingValue = newValue
            }
        )
    }
}
