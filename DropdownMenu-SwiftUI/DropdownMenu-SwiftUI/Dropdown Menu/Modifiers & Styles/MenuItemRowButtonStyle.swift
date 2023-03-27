//
//  MenuItemRowButtonStyle.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/19/23.
//

import SwiftUI

struct MenuItemRowButtonStyle: ButtonStyle {
    @Environment(\.iconTint) var tint: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configurationView(configuration))
    }
    
    @ViewBuilder
    private func configurationView(_ configuration: ButtonStyleConfiguration) -> some View {
        if configuration.isPressed {
            SelectionHighlight(color: tint)
        }
    }
}
