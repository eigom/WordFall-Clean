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

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

/*public protocol BooleanSetting: Setting where ValueType == Bool {
    init(identifier: String, defaultValue: Bool)
}*/

import Common

public class SettingImpl<V, Storage: SettingStorage, Notifier: ObserverNotifier>: Setting
        where Storage.ValueType == V, Notifier.Notification == V {
    private let identifier: String
    private let storage: Storage
    private let notifier: Notifier

    public var value: V {
        didSet {
            storage.store(value, for: identifier)
            notifier.notify(value)
        }
    }

    init(identifier: String, storage: Storage, value: V) {
        self.identifier = identifier
        self.storage = storage
        self.value = value
    }

    public func addObserver(_ observer: AnyObject, onUpdated: @escaping (V) -> Void) {
        notifier.addObserver(observer, onNotify: onUpdated)
    }

    public func removeObserver(_ observer: AnyObject) {
        notifier.removeObserver(observer)
    }
}

public class BooleanSetting: SettingImpl<Bool> {}



public class BooleanSetting<Storage: SettingStorage>: Setting where Storage.ValueType == Bool {
    private let identifier: String
    private let storage: Storage

    public var value: Bool {
        didSet {
            storage.store(value, for: identifier)
            // notify
        }
    }

    public init(identifier: String, storage: Storage, defaultValue: Bool) {
        self.identifier = identifier
        self.storage = storage
        value = storage.value(for: identifier) ?? defaultValue
    }

    public func addObserver(_ observer: AnyObject, onUpdated: (Bool) -> Void) {

    }

    public func removeObserver(_ observer: AnyObject) {

    }
}

public protocol BooleanSettingStorage: SettingStorage where ValueType == Bool {}

class UserDefaultsBooleanSettingStorage: BooleanSettingStorage {
    func value(for identifier: String) -> Bool? {
        return true
    }

    func store(_ value: Bool, for identifier: String) {

    }
}

public enum AppSettings {
    public static let boolSetting = BooleanSetting(
        identifier: "",
        storage: UserDefaultsBooleanSettingStorage(),
        defaultValue: true
    )
}
// need to have singleton!? make module AppSettings, def enum Settings, add as static properties
