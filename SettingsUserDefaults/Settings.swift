import Settings
import Common

public enum AppSettings {
    static func f() {
        AppSettings.soundEnabled.value = true
    }
    public static let soundEnabled: any BooleanSetting = SettingImpl(
        identifier: "SoundEnabled",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: true
    )

    public static let revealingPurchased: any BooleanSetting = SettingImpl(
        identifier: "RevealingPurchased",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: false
    )

    public static let wordLength: any Setting = SettingImpl(
        identifier: "WordLength",
        //storage: UserDefaultsWordLengthSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: .any
    )
}

