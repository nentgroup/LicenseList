import SwiftUI

/// A style for license views.
public enum LicenseViewStyle: Sendable {
    /// The style used to display just the license body.
    case plain(style: Appearance? = nil)
    /// The style used to display the license body and repository anchor link.
    case withRepositoryAnchorLink
  
  public struct Appearance: Sendable {
        public init(background: Color? = nil) {
            self.background = background
        }
    
        public let background: Color?
    }
}

public extension LicenseViewStyle {
    var background: Color? {
        switch self {
        case let .plain(style: style):
            return style?.background
        default: return nil
        }
    }
}

struct LicenseViewStyleKey: EnvironmentKey {
    static let defaultValue: LicenseViewStyle = .plain()
}

extension EnvironmentValues {
    var licenseViewStyle: LicenseViewStyle {
        get { self[LicenseViewStyleKey.self] }
        set { self[LicenseViewStyleKey.self] = newValue }
    }
}
