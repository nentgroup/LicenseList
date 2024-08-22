//
//  LicenseListViewStyle.swift
//
//
//  Created by Seto Elkahfi on 2024-08-21.
//

import Foundation
import SwiftUI

public struct LicenseListViewStyle {
  
  public init(font: Font? = nil, fontColor: Color? = nil, background: Color? = nil, listRowSeparatorTint: Color? = nil, listRowBackground: Color? = nil) {
      self.font = font
      self.fontColor = fontColor
      self.background = background
      self.listRowSeparatorTint = listRowSeparatorTint
      self.listRowBackground = listRowBackground
    }
  
    public let font: Font?
    public let fontColor: Color?
    public let background: Color?
    public let listRowSeparatorTint: Color?
    public let listRowBackground: Color?
}
