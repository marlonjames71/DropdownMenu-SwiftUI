//
//  SelectedItemView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-23.
//

import SwiftUI

struct SelectedItemView: View {
    
    @Environment(\.iconTint) var iconTint: Color
    
    @Binding var expanded: Bool
    @Binding var selectedItem: MenuItem?
    
    var placeholder: String
    let accentColor: Color
    
    // MARK: - Init
    
    init(
        expanded: Binding<Bool>,
        selectedItem: Binding<MenuItem?>,
        placeholder: String,
        accentColor: Color = .primary
    ) {
        self._expanded = expanded
        self._selectedItem = selectedItem
        self.placeholder = placeholder
        self.accentColor = accentColor
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            if let selectedItem {
                if let iconName = selectedItem.iconName {
                    Image(systemName: iconName)
                        .font(.body)
                        .frame(width: 30)
                        .foregroundColor(iconTint)
                        .aspectRatio(1.0, contentMode: .fit)
                        .fixedSize(horizontal: true, vertical: true)
                        .transition(.opacity)
                }
            
                Text(selectedItem.title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            } else {
                placeholderText
            }
            
            Spacer()
            
            Image(systemName: "chevron.down")
                .rotationEffect(.degrees(expanded ? -180 : 0))
                .font(.footnote)
                .foregroundColor(.primary)
        }
        .padding(.all, 16)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(
                response: 0.4,
                dampingFraction: 1.0,
                blendDuration: 0.8)
            ) {
                expanded.toggle()
            }
        }
    }
    
    // MARK: - Views
    
    private var placeholderText: some View {
        Text(placeholder)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .transition(.move(edge: .leading).combined(with: .opacity))
    }
}

// MARK: - Preview

struct SelectedItemView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedItemView(
            expanded: .constant(false),
            selectedItem: .constant(.mockMenuItem),
            placeholder: "Choose a security question"
        )
    }
}
