//
//  BBVALoginVC.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import UIKit

class BBVALoginVC: UIViewController {
    
    @IBOutlet weak var usersItem: UITextField!
    @IBOutlet weak var passwordItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goToHomeScreen()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func validatefields() -> Bool {
        if usersItem.isNulorEmpty() {
            self.simpleAlertError(titleError: .error,message: "El correo electrónico es requerido")
            return false
            
        } else if !usersItem!.text!.isValidEmail() {
            self.simpleAlertError(titleError: .error, message: "No cumple con la sintaxis de un correo electrónico")
            return false
            
        } else if passwordItem.isNulorEmpty() {
            self.simpleAlertError(titleError: .error,message: "La contraseña es requerida")
            return false
            
        } else if passwordItem.count().isLessThanOrEquals(7) {
            self.simpleAlertError(titleError: .error,message: "La contraseña requiere un minimo de 8 caracteres y maximo 16")
            return false
        }
        
        return true
    }
    
    @IBAction func loguinEvent(_ sender: Any) {
        
        if validatefields() {
            BBVALoading.show("Espere")
            goToHomeScreen()
        }
    }
}

extension BBVALoginVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength = 0
        let currentCharacterCount = textField.text?.count ?? 0
        let newLength = currentCharacterCount + string.count - range.length
        
        if string.isEquals(" ") {
            return false
        } else if textField.isEqual(passwordItem) {
            maxLength = 16
        } else {
            maxLength = 30
            if newLength.isEquals(30) {
                simpleAlertError(titleError: .warning, message: "Este campo tiene un límite de 30 caracteres")
            }
        }
        
        return newLength <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
