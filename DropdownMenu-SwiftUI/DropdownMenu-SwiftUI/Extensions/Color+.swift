//
//  Color+.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-24.
//

import SwiftUI
import UIKit

extension Color {
    static let bgPrimary = Color("bg-primary")
    static let bgSecondary = Color("bg-secondary")
    static let textSecondary = Color("text-secondary")
    static let iconPink = Color("icon-pink")
    static let iconBlue = Color("icon-blue")
    static let iconGreen = Color("icon-green")
}


extension Color {
    var isDark: Bool {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0
        guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil) else {
            return false
        }
        
        let lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        return lum < 0.5
    }
}
