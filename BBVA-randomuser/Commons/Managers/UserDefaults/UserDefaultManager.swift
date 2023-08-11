//
//  UserDefaultManager.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import Foundation

@frozen enum BatteryInfo: String {
    case none = ""
    /// Return float Value
    case batteryLevel = "batteryLevel"
    /// Return Int Value
    case batteryState = "batteryState"
    /// Return Bool Value
    case isLowPowerModeEnabled = "isLowPowerModeEnabled"
}

@frozen enum BatteryInfoDataType {
    case none
    case int
    case bool
    case float
}

class UserDefaultManager {
    
    static let shared = UserDefaultManager()

    private let defaults: UserDefaults
    
    private init() {
        defaults = UserDefaults.standard
    }
    
    func saveBatteryInfo() {
        FirebaseManager.shared.observeBateryEvent { dic in
            let batteryLevel = dic["batteryLevel"] as? Float ?? 0
            let batteryState = dic["batteryState"] as? Int ?? 0
            let isLowPowerModeEnabled = dic["isLowPowerModeEnabled"] as? Bool ?? false
            
            
            self.setValue(batteryLevel, forKey: .batteryLevel)
            self.setValue(batteryState, forKey: .batteryState)
            self.setValue(isLowPowerModeEnabled, forKey: .isLowPowerModeEnabled)
        }
    }
    
    /// Save in local storege any value by specific Key
    func setValue(_ value: Any, forKey key: BatteryInfo) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    /// Get Integer Values
    func getIntegerValue(forKey key: BatteryInfo) -> Int {
        return defaults.integer(forKey: key.rawValue)
    }
    
    /// Get Flotating Values
    func getFloatValue(forKey key: BatteryInfo) -> Float {
        return defaults.float(forKey: key.rawValue)
    }
    
    /// Get Bolean Values
    func getBoolValue(forKey key: BatteryInfo) -> Bool {
        return defaults.bool(forKey: key.rawValue)
    }
}
