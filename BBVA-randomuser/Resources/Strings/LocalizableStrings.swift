//
//  LocalizableStrings.swift
//  BBVA-randomuser
//
//  Created by Uriel Rodriguez on 23/06/23.
//

import Foundation

extension String {
    func localized(language: BBVAIdiom = .es) -> String {
        guard let path = Bundle.main.path(forResource: language.rawValue.lowercased(), ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
