//
//  Copyright 2023 Eigo Madaloja
//

import Settings
import Foundation

class UserDefaultsBooleanSettingStorage: SettingStorage {
    func value(for identifier: String) -> Bool? {
        return UserDefaults.standard.object(forKey: identifier) as? Bool
    }

    func store(_ value: Bool, for identifier: String) {
        UserDefaults.standard.set(value, forKey: identifier)
    }
}
