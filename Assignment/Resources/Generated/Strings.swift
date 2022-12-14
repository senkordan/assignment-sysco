// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Planets
  internal static let appName = L10n.tr("Localizable", "app_name", fallback: "Planets")
  /// Climate: %@
  internal static func climateTitle(_ p1: Any) -> String {
    return L10n.tr("Localizable", "climate_title", String(describing: p1), fallback: "Climate: %@")
  }
  /// Current climate is %@
  internal static func currentClimate(_ p1: Any) -> String {
    return L10n.tr("Localizable", "current_climate", String(describing: p1), fallback: "Current climate is %@")
  }
  /// Error
  internal static let error = L10n.tr("Localizable", "error", fallback: "Error")
  /// Something went wrong, Please try again later!
  internal static let generalErrorMessage = L10n.tr("Localizable", "general_error_message", fallback: "Something went wrong, Please try again later!")
  /// Active internet connection not found. Please connect to WIFI or Data
  internal static let noInternetMessage = L10n.tr("Localizable", "no_internet_message", fallback: "Active internet connection not found. Please connect to WIFI or Data")
  /// OK
  internal static let ok = L10n.tr("Localizable", "ok", fallback: "OK")
  /// Orbital period: %@
  internal static func orbitalPersionTitle(_ p1: Any) -> String {
    return L10n.tr("Localizable", "orbital_persion_title", String(describing: p1), fallback: "Orbital period: %@")
  }
  /// https://picsum.photos/seed/%@/200
  internal static func planetImageUrl(_ p1: Any) -> String {
    return L10n.tr("Localizable", "planet_image_url", String(describing: p1), fallback: "https://picsum.photos/seed/%@/200")
  }
  /// Name: %@
  internal static func planetName(_ p1: Any) -> String {
    return L10n.tr("Localizable", "planet_name", String(describing: p1), fallback: "Name: %@")
  }
  /// Could not find any data from server
  internal static let remoteNotFound = L10n.tr("Localizable", "remote_not_found", fallback: "Could not find any data from server")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
