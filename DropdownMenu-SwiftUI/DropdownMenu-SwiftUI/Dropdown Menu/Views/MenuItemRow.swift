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
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.showExcludedItemsAsDisabled) var showExcluded
    
    // MARK: - Body
    
    var body: some View {
        Button {
            setSelectedItem()
        } label: {
            HStack(alignment: item.hasSubtext ? .firstTextBaseline : .center, spacing: 4) {
                if let iconName = item.iconName {
                    Image(systemName: iconName)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(iconColor())
                        .frame(width: imageWidth)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(item.title)
                        .fontWeight(item.subtext != nil ? .semibold : .regular)
                        .fontDesign(.rounded)
                        .foregroundColor(foregroundColor())
                    
                    if let subtext = item.subtext {
                        Text(subtext)
                            .foregroundColor(.textSecondary)
                            .font(.caption)
                            .fontDesign(.rounded)
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, item.subtext != nil ? 10 : 16)
            .padding(.horizontal, 12)
            .background(background)
            .contentShape(Rectangle())
        }
        .buttonStyle(MenuItemRowButtonStyle(tintOverride: item.tint))
    }
    
    // MARK: - Views
    
    private func iconColor() -> Color {
        if let color = item.tint {
            return color
        } else {
            return foregroundColor()
        }
    }
    
    private func foregroundColor(normalColor: Color = .primary) -> Color {
        if item == selectedItem, item.subtext == nil {
            return tint.isDark ? .white : .black
        } else {
            return normalColor
        }
    }
    
    @ViewBuilder
    private var background: some View {
        if item == selectedItem {
            SelectionHighlight(color: item.subtext == nil ? tint : .secondary.opacity(0.2), style: .normal)
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
