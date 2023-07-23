//
//  Copyright 2023 Eigo Madaloja
//

import Settings
import Common

public class PersistedSetting<ValueType, Storage: SettingStorage, Notifier: ObserverNotifier>: Setting
where Storage.ValueType == ValueType, Notifier.Notification == ValueType {
    private let identifier: String
    private let storage: Storage
    private let notifier: Notifier

    public var value: ValueType {
        didSet {
            storage.store(value, for: identifier)
            notifier.notify(value)
        }
    }

    public init(identifier: String, storage: Storage, notifier: Notifier, defaultValue: ValueType) {
        self.identifier = identifier
        self.storage = storage
        self.notifier = notifier
        value = storage.value(for: identifier) ?? defaultValue
    }

    public func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void) {
        notifier.addObserver(observer, onNotify: onUpdated)
    }

    public func removeObserver(_ observer: AnyObject) {
        notifier.removeObserver(observer)
    }
}
