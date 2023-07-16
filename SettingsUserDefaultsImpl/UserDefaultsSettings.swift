//
//  Copyright 2023 Eigo Madaloja
//

import Settings
import PersistedSettingImpl
import Common

public enum UserDefaultsSettings: Settings {
    public static let soundEnabled: any BooleanSetting = PersistedSetting(
        identifier: "SoundEnabled",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: true
    )

    public static let revealingPurchased: any BooleanSetting = PersistedSetting(
        identifier: "RevealingPurchased",
        storage: UserDefaultsBooleanSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: false
    )

    public static let wordLength: any WordLengthSetting = PersistedSetting(
        identifier: "WordLength",
        storage: UserDefaultsWordLengthSettingStorage(),
        notifier: ObserverNotifierImpl(),
        defaultValue: .any
    )
}
