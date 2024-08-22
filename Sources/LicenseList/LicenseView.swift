import SwiftUI

/// A view that displays license body.
public struct LicenseView: View {

    /// Creates new license list view with the specified library.
    /// - Parameters:
    ///   - library: The library to use in this view.
    public init(library: Library) {
        self.library = library
    }

    /// The content and behavior of the license view.
    public var body: some View {
        ScrollView {
            Text(attributedLicenseBody)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear {
                    attributedLicenseBody = attribute(library.licenseBody)
                }
        }
        .navigationBarTitle(library.name)
        ._licenseViewStyle(licenseViewStyle) {
            if let url = library.url {
                openURL(url)
            }
        }
        .background(licenseViewStyle.background)
    }
  
    // MARK: - Private

    @State private var attributedLicenseBody = AttributedString(stringLiteral: "")

    @Environment(\.openURL) private var openURL: OpenURLAction
    @Environment(\.licenseViewStyle) private var licenseViewStyle: LicenseViewStyle

    private let library: Library

    private func attribute(_ inputText: String) -> AttributedString {
        var attributedText = AttributedString(inputText)
        let urls: [URL?] = inputText.match(URL.regexPattern)
            .map { URL(string: String(inputText[$0])) }
        let ranges = attributedText.match(URL.regexPattern)
        for case (let range, let url?) in zip(ranges, urls) {
            attributedText[range].link = url
        }
        return attributedText
    }
}


#Preview {
  LicenseView(
    library: Library(
      name: "OSS",
      url: "https://example.com",
      licenseBody: """
MIT License

Copyright (c) 2019 John Doe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""
    )
  )
  .licenseViewStyle(.plain(style: .init(background: .green)))
}
