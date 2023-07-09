import Settings
import Common

public enum AppSettings {
    public static let soundEnabled: any Setting = SettingImpl(
        identifier: "SoundEnabled",
        storage: UserDefaultsBooleanSettingStorage(),
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
