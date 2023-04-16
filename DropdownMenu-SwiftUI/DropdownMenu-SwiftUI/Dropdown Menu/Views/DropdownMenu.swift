//
//  DropdownMenu.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/14/23.
//

import SwiftUI

struct DropdownMenu: View {
	
	let title: String?
	let placeholder: String?
	let menuItems: [MenuItem]
	
	@State private var expanded = false
	@Binding var selectedItem: MenuItem?
	
	private let showClearButton: Bool
	
	let excludedItems: [MenuItem]
	
	// MARK: - Init
	
	init(
		title: String? = nil,
		placeholder: String?,
		menuItems: [MenuItem],
		selectedItem: Binding<MenuItem?>,
		showClearButton: Bool = true,
		excludedItems: MenuItem?...
	) {
		self.title = title
		self.placeholder = placeholder
		self.menuItems = menuItems
		self._selectedItem = selectedItem
		self.showClearButton = showClearButton
		self.excludedItems = excludedItems.compactMap { $0 }
	}
	
	init(
		title: String? = nil,
		placeholder: String?,
		menuItems: [MenuItem],
		selectedItem: Binding<MenuItem?>,
		showClearButton: Bool = true,
		scrollToTopOnClear: Bool = true
	) {
		self.title = title
		self.placeholder = placeholder
		self.menuItems = menuItems
		self._selectedItem = selectedItem
		self.showClearButton = showClearButton
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
			
			SelectedItemView(
				expanded: $expanded,
				selectedItem: $selectedItem,
				placeholder: placeholder ?? ""
			)
			
			VStack(spacing: 0) {
				SelectedItemView(
					expanded: $expanded,
					selectedItem: $selectedItem,
					placeholder: placeholder ?? ""
				)
				
				DropdownMenuList(
					menuItems: menuItems,
					selectedItem: $selectedItem,
					excludedItems: excludedItems,
					expanded: expanded
				)
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
}

// MARK: - Library Content

struct DropdownMenuLibraryContent: LibraryContentProvider {
	@LibraryContentBuilder
	public var views: [LibraryItem] {
		LibraryItem(
			DropdownMenu(
				placeholder: "Choose an option...",
				menuItems: MenuItem.mockMenuItems,
				selectedItem: .constant(nil)
			),
			title: "Dropdown Menu",
			category: .control
		)
	}
}

// MARK: - Preview

struct DropdownMenu_Previews: PreviewProvider {
	static var previews: some View {
		DropdownMenu(
			title: "Security Question 1",
			placeholder: "Choose a security question",
			menuItems: MenuItem.mockMenuItems,
			selectedItem: .constant(.mockMenuItem)
		)
	}
}
