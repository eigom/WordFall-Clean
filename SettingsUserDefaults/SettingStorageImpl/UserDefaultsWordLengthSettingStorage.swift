import Settings
import Words

class UserDefaultsWordLengthSettingStorage: SettingStorage {
    func value(for identifier: String) -> WordLength? {
        return UserDefaults.standard.object(forKey: identifier)
            .flatMap { $0 as? UInt }
            .flatMap { WordLength(storageValue: $0) }
    }

    func store(_ value: WordLength, for identifier: String) {
        UserDefaults.standard.set(value.storageValue, forKey: identifier)
    }
}

extension WordLength {
    var storageValue: UInt {
        switch self {
        case .fixed(let length):
            return length
        case .any:
            return 0
        }
    }

    init?(storageValue: UInt) {
        switch storageValue {
        case 0:
            self = .any
        case 0...:
            self = .fixed(length: storageValue)
        default:
            return nil
        }
    }
}
