//
//  LicenseListViewStyle.swift
//
//
//  Created by Seto Elkahfi on 2024-08-21.
//

import Foundation
import SwiftUI

public struct LicenseListViewStyle {
  
    public init(background: Color? = nil, listRowBackground: Color? = nil) {
      self.background = background
      self.listRowBackground = listRowBackground
    }
  
    public let background: Color?
    public let listRowBackground: Color?
}
