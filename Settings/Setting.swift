public protocol BooleanSettingStorage {
    func value(for identifier: String) -> Bool?
    func store(_ value: Bool, for identifier: String)
}

public protocol StringSettingStorage {
    func value(for identifier: String) -> String?
    func store(_ value: String, for identifier: String)
}

class UserDefaultsSettingStorage: BooleanSettingStorage, StringSettingStorage {
    func value(for identifier: String) -> Bool? {
        return true
    }

    func store(_ value: Bool, for identifier: String) {

    }

    func value(for identifier: String) -> String? {
        return ""
    }

    func store(_ value: String, for identifier: String) {
        
    }
}

public protocol Setting {
    associatedtype ValueType

    var kind: SettingKind { get }
    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

public enum SettingKind {
    case soundEnabled
}
