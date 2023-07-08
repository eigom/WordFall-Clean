/*public protocol BooleanSettingStorage {
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
}*/

public protocol SettingStorage {
    associatedtype ValueType

    func value(for identifier: String) -> ValueType?
    func store(_ value: ValueType, for identifier: String)
}

public protocol Setting {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

/*public protocol BooleanSetting: Setting where ValueType == Bool {
    init(identifier: String, defaultValue: Bool)
}*/



class BooleanSetting<Storage: SettingStorage>: Setting where Storage.ValueType == Bool {
    private let storage: Storage

    var value: Bool

    init(identifier: String, storage: Storage, defaultValue: Bool) {
        self.storage = storage
        value = storage.value(for: identifier) ?? defaultValue
    }

    func addObserver(_ observer: AnyObject, onUpdated: (Bool) -> Void) {

    }

    func removeObserver(_ observer: AnyObject) {

    }
}

protocol BooleanSettingStorage: SettingStorage where ValueType == Bool {}

class UserDefaultsBooleanSettingStorage: BooleanSettingStorage {
    func value(for identifier: String) -> Bool? {
        return true
    }

    func store(_ value: Bool, for identifier: String) {

    }
}

let boolSetting = BooleanSetting(
    identifier: "",
    storage: UserDefaultsBooleanSettingStorage(),
    defaultValue: true
)

// need to have singleton!?
