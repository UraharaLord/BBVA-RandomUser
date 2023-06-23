//
//  BatteryVC.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import UIKit

class BatteryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    
    func setupScreen() {
        title = "Persons"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        FirebaseManager.shared.observeBateryEvent()
    }
}
