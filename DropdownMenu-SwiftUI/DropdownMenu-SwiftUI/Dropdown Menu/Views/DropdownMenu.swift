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
    private let showClearButton: Bool
    private let scrollToTopOnClear: Bool // Completely optional
    let excludedItems: [MenuItem]
    
    // MARK: - Init
    
    init(
        title: String? = nil,
        menuItems: [MenuItem],
        selectedItem: Binding<MenuItem?>,
        showClearButton: Bool = true,
        scrollToTopOnClear: Bool = false,
        excludedItems: MenuItem?...
    ) {
        self.title = title
        self.menuItems = menuItems
        self._selectedItem = selectedItem
        self.showClearButton = showClearButton
        self.scrollToTopOnClear = scrollToTopOnClear
        self.excludedItems = excludedItems.compactMap { $0 }
    }
    
    init(
        title: String? = nil,
        menuItems: [MenuItem],
        selectedItem: Binding<MenuItem?>,
        showClearButton: Bool = true,
        scrollToTopOnClear: Bool = false
    ) {
        self.title = title
        self.menuItems = menuItems
        self._selectedItem = selectedItem
        self.showClearButton = showClearButton
        self.scrollToTopOnClear = scrollToTopOnClear
        self.excludedItems = []
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            MenuTitleView(
                title: title,
                provideResetButton: showClearButton,
                selectedItem: $selectedItem
            )
            
            VStack(spacing: 0) {
                SelectedItemView(
                    expanded: $expanded,
                    selectedItem: $selectedItem,
                    placeholder: "Choose a security question"
                )
                
                if expanded {
                    Divider()
                    if validMenuItems.isEmpty {
                        Text("No other options available")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 6)
                    } else {
                        ScrollViewReader { proxy in
                            VStack(spacing: 3) {
                                ForEach(validMenuItems) { item in
                                    MenuItemRow(item: item, selectedItem: $selectedItem)
                                        .tag(item.id)
                                }
                                .onAppear {
                                    proxy.scrollTo(selectedItem?.id ?? .init())
                                }
                            }
                            .padding(.vertical, 6)
                            .embedInScrollView(validMenuItems.count > 4)
                            .frame(maxHeight: validMenuItems.count < 5 ? nil : 310)
                            .onChange(of: selectedItem) { item in
                                // Completely optional
                                guard expanded, scrollToTopOnClear else { return }
                                if item == nil {
                                    if let first = validMenuItems.first {
                                        withAnimation {
                                            proxy.scrollTo(first.id)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
            .background(Color.bgSecondary)
            .smoothRoundedCorners(expanded ? 16 : 12)
            .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0.0, y: 2.0)
            .onChange(of: selectedItem) { _ in
                withAnimation(.spring(
                    response: 0.4,
                    dampingFraction: 1.0,
                    blendDuration: 0.8
                )) {
                    guard selectedItem != nil else { return }
                    expanded.toggle()
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    
    private var validMenuItems: [MenuItem] {
        if excludedItems.isEmpty {
            return menuItems
        } else {
            return menuItems.filter { !excludedItems.contains($0) }
        }
    }
}

// MARK: - Preview

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            title: "Security Question 1",
            menuItems: MenuItem.mockMenuItems,
            selectedItem: .constant(.mockMenuItem)
        )
    }
}
