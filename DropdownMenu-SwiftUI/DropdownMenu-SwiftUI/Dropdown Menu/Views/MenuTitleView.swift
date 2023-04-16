//
//  MenuTitleView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-24.
//

import SwiftUI

struct MenuTitleView: View {
	
	let title: String?
	let provideResetButton: Bool
	@Binding var selectedItem: MenuItem?
	
	// MARK: - Body
	
	var body: some View {
		if provideResetButton || title != nil {
			HStack {
				if let title {
					Text(title)
						.font(.subheadline)
						.multilineTextAlignment(.leading)
						.fixedSize(horizontal: false, vertical: true)
						.padding(.leading, 8)
				}
				
				Spacer()
				
				if selectedItem != nil, provideResetButton {
					clearSelectionButton
				}
			}
		}
	}
	
	// MARK: - Views
	
	private var clearSelectionButton: some View {
		Button(action: clearSelection) {
			Text("Clear")
				.font(.caption)
				.foregroundColor(.primary)
				.padding(.trailing, 8)
		}
	}
	
	// MARK: - Helper Methods
	
	private func clearSelection() {
		guard selectedItem != nil else { return }
		withAnimation(.spring()) { selectedItem = nil }
	}
}

struct MenuTitleView_Previews: PreviewProvider {
	static var previews: some View {
		MenuTitleView(
			title: nil,
			provideResetButton: true,
			selectedItem: .constant(.mockMenuItem)
		)
	}
}
