//
//  View+ScrollView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-24.
//

import SwiftUI

extension View {
	@ViewBuilder func embedInScrollView(
		_ shouldEmbed: Bool = true,
		axis: Axis.Set = .vertical,
		showsIndicators: Bool = true
	) -> some View {
		if shouldEmbed {
			ScrollView(axis, showsIndicators: showsIndicators) { self }
		} else { self }
	}
}
