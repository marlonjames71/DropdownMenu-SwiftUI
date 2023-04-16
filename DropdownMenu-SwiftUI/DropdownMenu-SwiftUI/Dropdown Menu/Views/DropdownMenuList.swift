//
//  DropdownMenuList.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-04.
//

import SwiftUI

struct DropdownMenuList: View {
	
	// MARK: - Properties
	
	let menuItems: [MenuItem]
	@Binding var selectedItem: MenuItem?
	let excludedItems: [MenuItem]
	let expanded: Bool
	
	// MARK: - Environment Values
	
	@Environment(\.showExcludedItemsAsDisabled) var showExcluded
	
	// MARK: - Body
	
	var body: some View {
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
								.opacity(opacity(item: item))
								.disabled(shouldDisable(item: item))
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
						guard expanded, item == nil else { return }
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
	
	// MARK: - Helper Methods
	
	private var validMenuItems: [MenuItem] {
		guard !showExcluded else { return menuItems }
		
		if excludedItems.isEmpty {
			return menuItems
		} else {
			return menuItems.filter { !excludedItems.contains($0) }
		}
	}
	
	private func shouldDisable(item: MenuItem) -> Bool {
		guard showExcluded else { return false }
		return excludedItems.contains(item) && item != selectedItem
	}
	
	private func opacity(item: MenuItem) -> Double {
		shouldDisable(item: item) ? 0.3 : 1
	}
}

// MARK: - Preview

struct DropdownMenuList_Previews: PreviewProvider {
	static var previews: some View {
		DropdownMenuList(
			menuItems: MenuItem.mockMenuItems,
			selectedItem: .constant(MenuItem.mockMenuItem),
			excludedItems: [],
			expanded: true
		)
	}
}
