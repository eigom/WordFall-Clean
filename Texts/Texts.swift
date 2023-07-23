// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Text {
  public enum Alert {
    /// Word Fall
    public static let defaultTitle = Text.tr("Localizable", "alert.defaultTitle", fallback: "Word Fall")
    public enum Action {
      /// Cancel
      public static let cancel = Text.tr("Localizable", "alert.action.cancel", fallback: "Cancel")
      /// OK
      public static let dismiss = Text.tr("Localizable", "alert.action.dismiss", fallback: "OK")
    }
  }
  public enum Gameplay {
    public enum Intro {
      /// WordFall
      public static let word = Text.tr("Localizable", "gameplay.intro.word", fallback: "WordFall")
      public enum Definition {
        /// a word game where you form words and names from falling letters
        public static let text = Text.tr("Localizable", "gameplay.intro.definition.text", fallback: "a word game where you form words and names from falling letters")
        /// noun
        public static let type = Text.tr("Localizable", "gameplay.intro.definition.type", fallback: "noun")
      }
    }
    public enum NextButton {
      /// NEXT
      public static let title = Text.tr("Localizable", "gameplay.nextButton.title", fallback: "NEXT")
    }
    public enum PurchaseAlert {
      /// %@
      public static func title(_ p1: Any) -> String {
        return Text.tr("Localizable", "gameplay.purchaseAlert.title", String(describing: p1), fallback: "%@")
      }
      public enum PurchaseAction {
        /// Get for %@
        public static func title(_ p1: Any) -> String {
          return Text.tr("Localizable", "gameplay.purchaseAlert.purchaseAction.title", String(describing: p1), fallback: "Get for %@")
        }
      }
    }
    public enum RevealButton {
      /// REVEAL
      public static let title = Text.tr("Localizable", "gameplay.revealButton.title", fallback: "REVEAL")
      public enum Purchase {
        /// get for %@
        public static func subtitle(_ p1: Any) -> String {
          return Text.tr("Localizable", "gameplay.revealButton.purchase.subtitle", String(describing: p1), fallback: "get for %@")
        }
      }
      public enum RevealsLeft {
        /// %@ left
        public static func subtitle(_ p1: Any) -> String {
          return Text.tr("Localizable", "gameplay.revealButton.revealsLeft.subtitle", String(describing: p1), fallback: "%@ left")
        }
      }
    }
    public enum SettingsButton {
      /// ⦿
      public static let title = Text.tr("Localizable", "gameplay.settingsButton.title", fallback: "⦿")
    }
  }
  public enum Settings {
    public enum RestorePurchasesButton {
      /// restoring...
      public static let restoringTitle = Text.tr("Localizable", "settings.restorePurchasesButton.restoringTitle", fallback: "restoring...")
      /// Restore purchase
      public static let title = Text.tr("Localizable", "settings.restorePurchasesButton.title", fallback: "Restore purchase")
    }
    public enum Sound {
      /// Off
      public static let off = Text.tr("Localizable", "settings.sound.off", fallback: "Off")
      /// On
      public static let on = Text.tr("Localizable", "settings.sound.on", fallback: "On")
      /// SOUND
      public static let title = Text.tr("Localizable", "settings.sound.title", fallback: "SOUND")
    }
    public enum WordLength {
      /// All
      public static let all = Text.tr("Localizable", "settings.wordLength.all", fallback: "All")
      /// WORD LENGTH
      public static let title = Text.tr("Localizable", "settings.wordLength.title", fallback: "WORD LENGTH")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Text {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
