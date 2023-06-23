//
//  BBVABatteryInfo.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import UIKit
import Foundation

class BBVABatteryInfo {
    
    static let shared = BBVABatteryInfo()
    
    private let device = UIDevice.current
   
    var batteryLevel: Float {
        device.isBatteryMonitoringEnabled = true
        return device.batteryLevel
    }
       
    var batteryState: UIDevice.BatteryState {
        device.isBatteryMonitoringEnabled = true
        return device.batteryState
    }
       
    var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }
}
