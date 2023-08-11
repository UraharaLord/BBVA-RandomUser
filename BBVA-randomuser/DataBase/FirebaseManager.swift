//
//  FirebaseManager.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import Foundation
import FirebaseDatabase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private let dataBase = Database.database().reference()
    
    func addNewentry() {
        let obj: [String: Any] = [
            "batteryLevel": BBVABatteryInfo.shared.batteryLevel as Float,
            "batteryState": BBVABatteryInfo.shared.batteryState as NSNumber,
            "isLowPowerModeEnabled": BBVABatteryInfo.shared.isLowPowerModeEnabled as Bool
        ]
        dataBase.child("BatteryData").setValue(obj)
    }
    
    func observeBateryEvent(completion: @escaping([String: Any]) -> Void) {
        dataBase.child("BatteryData").observeSingleEvent(of: .value) { response in
            guard let value = response.value as? [String: Any] else {
                return
            }
            
            print("Datos: ", value)
            completion(value)
        }
    }
}
