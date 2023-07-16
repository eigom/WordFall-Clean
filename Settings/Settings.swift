//
//  Copyright 2023 Eigo Madaloja
//

public protocol Settings {
    static var soundEnabled: any BooleanSetting { get }
    static var revealingPurchased: any BooleanSetting { get }
    static var wordLength: any WordLengthSetting { get }
}
