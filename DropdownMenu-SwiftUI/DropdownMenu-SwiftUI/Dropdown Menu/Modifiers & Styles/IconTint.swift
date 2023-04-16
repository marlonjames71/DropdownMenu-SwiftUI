//
//  IconTint.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-24.
//

import SwiftUI

struct IconTintKey: EnvironmentKey {
	static var defaultValue: Color = Color.accentColor
}

extension EnvironmentValues {
	var iconTint: Color {
		get { self[IconTintKey.self] }
		set { self[IconTintKey.self] = newValue }
	}
}

extension View  {
	func iconTint(_ tint: Color) -> some View {
		environment(\.iconTint, tint)
	}
}
