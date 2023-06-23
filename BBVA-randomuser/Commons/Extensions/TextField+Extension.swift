//
//  TextField+Extension.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import UIKit

extension UITextField {
    
    func isNulorEmpty() -> Bool {
        return self.text!.isEmpty
    }
    
    func count() -> Int {
        return self.text!.count
    }
}
