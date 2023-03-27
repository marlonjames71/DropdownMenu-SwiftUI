//
//  MenuItemRow.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/19/23.
//

import SwiftUI

struct MenuItemRow: View {
    private let imageWidth: CGFloat = 28
    let item: MenuItem
    @Binding var selectedItem: MenuItem?
    
    @Environment(\.iconTint) var tint: Color
    
    // MARK: - Body
    
    var body: some View {
        Button {
            setSelectedItem()
        } label: {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                if let iconName = item.iconName {
                    Image(systemName: iconName)
                        .font(.body)
                        .foregroundColor(foregroundColor())
                        .frame(width: imageWidth)
                }
                Text(item.title)
                    .foregroundColor(foregroundColor())
                Spacer()
            }
            .padding(.vertical)
            .padding(.horizontal, 16)
            .background(background)
            .contentShape(Rectangle())
        }
        .buttonStyle(MenuItemRowButtonStyle())
    }
    
    // MARK: - Views
    
    private func foregroundColor(normalColor: Color = .primary) -> Color {
        if item == selectedItem {
            return tint.isDark ? .white : .black
        } else {
            return normalColor
        }
    }
    
    @ViewBuilder
    private var background: some View {
        if item == selectedItem {
            SelectionHighlight(color: tint, style: .normal)
        }
    }
    
    // MARK: - Helper Methods
    
    private func setSelectedItem() {
        withAnimation(.spring()) {
            guard selectedItem != item else { return }
            selectedItem = item
        }
    }
}

// MARK: - Preview

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(item: .mockMenuItem, selectedItem: .constant(.mockMenuItem))
    }
}
