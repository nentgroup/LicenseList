import SwiftUI

/// A view that presents license views in a list format.
public struct LicenseListView: View {

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
        List {
            ForEach(libraries) { library in
                if let navigationHandler {
                    HStack {
                        Button {
                            navigationHandler(library)
                        } label: {
                            Text(library.name)
                        }
                        .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.subheadline.bold())
                        #if os(iOS)
                            .foregroundColor(Color(.systemGray3))
                        #endif
                    }
                    .listRowBackground(style?.listRowBackground)
                  
                } else {
                    NavigationLink {
                        LicenseView(library: library)
                            .licenseViewStyle(licenseViewStyle)
                    } label: {
                        Text(library.name)
                    }
                    .listRowBackground(style?.listRowBackground)
                }
            }
        }
        #if os(iOS)
        .listStyle(.insetGrouped)
        #endif
    }
  
    // MARK: - Private
  
    @Environment(\.licenseViewStyle) private var licenseViewStyle: LicenseViewStyle

    private var libraries = Library.libraries
    private let navigationHandler: ((Library) -> Void)?
    private let style: LicenseListViewStyle?
}

#Preview {
    LicenseListView(
        libraries: Array(Library.libraries.prefix(5)),
        navigationHandler: nil
    )
}
