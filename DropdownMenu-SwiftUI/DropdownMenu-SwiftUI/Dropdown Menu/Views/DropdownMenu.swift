//
//  DropdownMenu.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/14/23.
//

import SwiftUI

struct DropdownMenu: View {
    
    let title: String?
    let menuItems: [MenuItem]
    @State private var expanded = false
    @Binding var selectedItem: MenuItem?
    let provideResetButton: Bool
    
    // MARK: - Init
    
    init(
        title: String?,
        menuItems: [MenuItem],
        selectedItem: Binding<MenuItem?>,
        provideResetButton: Bool
    ) {
        self.title = title
        self.menuItems = menuItems
        self._selectedItem = selectedItem
        self.provideResetButton = provideResetButton
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            MenuTitleView(
                title: title,
                provideResetButton: provideResetButton,
                selectedItem: $selectedItem
            )
            
            VStack(spacing: 0) {
                SelectedItemView(
                    expanded: $expanded,
                    selectedItem: $selectedItem,
                    placeholder: "Choose a security question"
                )
                
                if expanded {
                    VStack(spacing: 3) {
                        ForEach(menuItems) { item in
                            MenuItemRow(item: item, selectedItem: $selectedItem)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
            .background(Color.bgSecondary)
            .smootheRoundedCorners(expanded ? 16 : 12)
            .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0.0, y: 2.0)
            .onChange(of: selectedItem) { _ in
                withAnimation(.spring(
                    response: 0.4,
                    dampingFraction: 1.0,
                    blendDuration: 0.8
                )) {
                    guard expanded else { return }
                    expanded.toggle()
                }
            }
        }
    }
}

// MARK: - Preview

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            title: "Security Question 1",
            menuItems: MenuItem.mockMenuItems,
            selectedItem: .constant(.mockMenuItem),
            provideResetButton: false
        )
    }
}
