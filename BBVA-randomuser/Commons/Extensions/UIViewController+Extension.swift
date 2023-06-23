//
//  UIViewController+Extension.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 22/06/23.
//

import UIKit

@frozen enum AlertError: String {
    case none = ""
    case error = "Error"
    case warning = "Advertencia"
}

@frozen enum NavigationMethod {
    case none
    case push
    case present
}

@frozen enum StoryBoards: String {
    case none = ""
    case MVCHome = "MVCHome"
}

@frozen enum ScreenID: String {
    case none = ""
    case MVCHome = "TabBarID"
}

extension UIViewController {
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func simpleAlertError(titleError: AlertError, message: String) {
        let alert = UIAlertController(title: titleError.rawValue, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func navigateTo(identifier: ScreenID, method: NavigationMethod, storyboard: StoryBoards) {
        
        let sBoard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vctrl = sBoard.instantiateViewController(withIdentifier: identifier.rawValue)
            
        DispatchQueue.main.async {
            if method == .push {
                self.navigationController?.pushViewController(vctrl, animated: true)
            }
        
            if method == .present {
                self.present(vctrl, animated: true, completion: nil)
            }
        }
    }
}
