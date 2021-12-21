//
//  Configurations.swift
//  SimpleCreation
//
//  Created by Erum on 22/12/21.
//

import Foundation

struct  Configurations {
    static func getValue(for key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            return ""
        }
        return value
    }
}
