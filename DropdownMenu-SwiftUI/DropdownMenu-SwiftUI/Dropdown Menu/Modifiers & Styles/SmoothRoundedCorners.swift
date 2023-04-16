//
//  SmoothRoundedCorners.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-24.
//

import SwiftUI

struct CornerRadius: ViewModifier {
	let cornerRadius: CGFloat
	let style: RoundedCornerStyle
	
	init(_ cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous) {
		self.cornerRadius = cornerRadius
		self.style = style
	}
	
	func body(content: Content) -> some View {
		content.clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: style))
	}
}

extension View {
	func smoothRoundedCorners(_ cornerRadius: CGFloat = 10.0) -> some View {
		modifier(CornerRadius(cornerRadius, style: .continuous))
	}
	
	func roundedCorners(_ cornerRadius: CGFloat = 10.0) -> some View {
		modifier(CornerRadius(cornerRadius, style: .circular))
	}
}
