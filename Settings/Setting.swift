public protocol Setting {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

public protocol SettingStorage {
    associatedtype ValueType

    func value(for identifier: String) -> ValueType?
    func store(_ value: ValueType, for identifier: String)
}

import Common

public protocol BooleanSettingStorage: SettingStorage where ValueType == Bool {}

public protocol BooleanSettingUpdateNotifier: ObserverNotifier where Notification == Bool {}

public class BooleanSetting: Setting {
    private let identifier: String
    private let storage: any BooleanSettingStorage
    private let updateNotifier: any BooleanSettingUpdateNotifier

    public var value: Bool {
        didSet {
            storage.store(value, for: identifier)
            updateNotifier.notify(value)
        }
    }

    public init(
        identifier: String,
        storage: any BooleanSettingStorage,
        updateNotifier: any BooleanSettingUpdateNotifier,
        defaultValue: Bool) {
        self.identifier = identifier
        self.storage = storage
        self.updateNotifier = updateNotifier
        value = storage.value(for: identifier) ?? defaultValue
    }

    public func addObserver(_ observer: AnyObject, onUpdated: @escaping (Bool) -> Void) {
        updateNotifier.addObserver(observer, onNotify: onUpdated)
    }

    public func removeObserver(_ observer: AnyObject) {
        updateNotifier.removeObserver(observer)
    }
}

class UserDefaultsBooleanSettingStorage: BooleanSettingStorage {
    func value(for identifier: String) -> Bool? {
        return UserDefaults.standard.object(forKey: identifier) as? Bool
    }

    func store(_ value: Bool, for identifier: String) {
        UserDefaults.standard.set(value, forKey: identifier)
    }
}

extension ObserverNotifierImpl: BooleanSettingUpdateNotifier where Notification == Bool {}
extension ObserverNotifierMainThreadDecorator: BooleanSettingUpdateNotifier where Notification == Bool {}

public enum AppSettings {
    public static let boolSetting = BooleanSetting(
        identifier: "",
        storage: UserDefaultsBooleanSettingStorage(),
        updateNotifier: ObserverNotifierMainThreadDecorator(notifier: ObserverNotifierImpl<Bool>()),
        defaultValue: true
    )
}

