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
        currentPage += 1
        BBVAService.shared.getAllPersons(page: "\(currentPage)") { result in
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
        if currentPage.isEquals(1) {
            self.person = persons
        } else {
            self.person?.results.append(contentsOf: persons.results)
        }
        
        self.filterPerson = self.person
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
