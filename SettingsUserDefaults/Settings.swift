import Settings
import Common

/*public protocol Setting {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

public protocol StringRepresentableSetting {
    associatedtype ValueType

    var stringRepresentation: String { get }

    init?(stringRepresentation: String)
}

public protocol SettingStorage {
    associatedtype ValueType: StringRepresentableSetting

    func value(for identifier: String) -> ValueType?
    func store(_ value: ValueType, for identifier: String)
}*/

//public protocol BooleanSetting: Setting where ValueType == Bool {}
//extension SettingImpl: BooleanSetting where ValueType == Bool {}

public enum AppSettings {
    static func f() {
        AppSettings.soundEnabled.value = true
    }
    public static let soundEnabled: any BooleanSetting = BooleanSettingImpl(
        identifier: "SoundEnabled",
        //storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: true
    )

    public static let revealingPurchased: any Setting = SettingImpl(
        identifier: "RevealingPurchased",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: false
    )

    public static let wordLength: any Setting = SettingImpl(
        identifier: "WordLength",
        storage: UserDefaultsWordLengthSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: .any
    )
}

