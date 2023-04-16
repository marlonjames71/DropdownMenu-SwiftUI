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
	
	let feedback = UIImpactFeedbackGenerator(style: .rigid)
	
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
		HStack(alignment: .top, spacing: 8) {
			if let selectedItem {
				if let iconName = selectedItem.iconName {
					Image(systemName: iconName)
						.font(.body)
						.fontWeight(.light)
						.frame(width: 30)
						.foregroundColor(iconColor)
						.aspectRatio(1.0, contentMode: .fit)
						.fixedSize(horizontal: true, vertical: true)
						.transition(.opacity)
				}
				
				Text(selectedItem.title)
					.fontDesign(.rounded)
					.multilineTextAlignment(.leading)
					.lineLimit(3)
					.fixedSize(horizontal: false, vertical: true)
					.transition(placeholder.isEmpty ? .opacity : .move(edge: .trailing).combined(with: .opacity))
			} else {
				placeholderText
					.frame(minHeight: 20)
			}
			
			Spacer()
			
			Image(systemName: "chevron.down")
				.frame(height: 20)
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
				feedback.impactOccurred(intensity: 0.6)
				expanded.toggle()
			}
		}
	}
	
	// MARK: - Views
	
	private var placeholderText: some View {
		Text(placeholder)
			.fontDesign(.rounded)
			.foregroundColor(.secondary)
			.multilineTextAlignment(.leading)
			.fixedSize(horizontal: false, vertical: true)
			.transition(.move(edge: .leading).combined(with: .opacity))
	}
	
	// MARK: - Helpers
	
	private var iconColor: Color {
		if let tint = selectedItem?.tint {
			return tint
		} else {
			return iconTint
		}
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
