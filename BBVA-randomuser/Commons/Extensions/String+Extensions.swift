//
//  String+Extensions.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

public extension String {
        
    /// This method values if the string have the correct email format
    /// - Parameters:
    /// - testStr: string to values
    func isValidEmail() -> Bool {
        let emailRegEx = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isEquals(_ value: String) -> Bool {
        return self == value ? true : false
    }
    
    func toInt() -> Int {
        return Int(self) ?? 0
    }
}
