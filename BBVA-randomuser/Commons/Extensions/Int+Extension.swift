//
//  Int+Extension.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

public extension Int {
    
    func isEquals(_ value: Int) -> Bool {
        return value == self ? true : false
    }
    
    func isGreaterThanOrEquals(_ value: Int) -> Bool {
        return self >= value ? true : false
    }
    
    func isLessThanOrEquals(_ value: Int) -> Bool {
        return self <= value ? true : false
    }
    
    func isDifferent(_ value: Int) -> Bool {
        return self != value ? true : false
    }

    func toString() -> String {
        return String(self)
    }
    
}
