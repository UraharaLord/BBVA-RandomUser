//
//  BBVALoginVC+Bind.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import Foundation

extension BBVALoginVC {
    
    func goToHomeScreen() {
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            BBVALoading.hide()
            self.navigateTo(identifier: .MVCHome, method: .present, storyboard: .MVCHome)
        }
    }
}
