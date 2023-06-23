//
//  PersonsTableVC+Bind.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import Foundation

extension PersonsTableVC {
    func getDataPersons() {
        
        BBVALoading.show()
        BBVAService.shared.getAllPersons { result in
            BBVALoading.hide()
            
            if case .success(let personResponse) = result {
                self.updateUI(personResponse)
            }
            
            if case .failure(let error) = result {
                self.simpleAlertError(titleError: .error, message: error.localizedDescription)
            }
        }
    }
    
    func updateUI(_ persons: BBVAPersonsResponse) {
        self.person = persons
        self.filterPerson = persons
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
