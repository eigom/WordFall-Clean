import Settings
import Common

public enum AppSettings {
    public static let soundEnabled: any Setting = SettingImpl(
        identifier: "soundEnabled",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: true
    )
}
