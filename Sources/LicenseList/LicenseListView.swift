import SwiftUI

/// A view that presents license views in a list format.
public struct LicenseListView: View {
    @Environment(\.licenseListViewStyle) private var _licenseListViewStyle
    @Environment(\.licenseViewStyle) private var _licenseViewStyle

    let libraries = Library.libraries
    let navigationHandler: ((Library) -> Void)?

    /// Creates new license list view.
    /// - Parameters:
    ///   - navigationHandler: The closure to navigate for the given ``Library``.
    ///     This is used when controlling navigation using a UINavigationController.
    public init(
        libraries: [Library] = Library.libraries,
        navigationHandler: ((Library) -> Void)? = nil,
        style: LicenseListViewStyle? = nil
    ) {
        self.navigationHandler = navigationHandler
        self.libraries = libraries
        self.style = style
    }

    /// The content and behavior of the license list view.
    public var body: some View {
        AnyView(_licenseListViewStyle.makeBody(configuration: .init(
            libraries: libraries,
            navigationHandler: navigationHandler,
            licenseViewStyle: _licenseViewStyle
        )))
        .accessibilityIdentifier("license_list_view")
    }
  
    // MARK: - Private
  
    @Environment(\.licenseViewStyle)
    private var licenseViewStyle: LicenseViewStyle

    private var libraries = Library.libraries
    private let navigationHandler: ((Library) -> Void)?
    private let style: LicenseListViewStyle?
}

#Preview {
    LicenseListView(
        libraries: Array(Library.libraries.prefix(5)),
        navigationHandler: { _ in },
        style: .init(
          background: .black,
          listRowSeparatorTint: .yellow,
          listRowBackground: .red
        )
    )
}
