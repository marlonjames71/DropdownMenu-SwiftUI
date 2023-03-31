//
//  DisabledItem.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-03-30.
//

import SwiftUI

struct DisabledItemKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var showExcludedItemsAsDisabled: Bool {
        get { self[DisabledItemKey.self] }
        set { self[DisabledItemKey.self] = newValue }
    }
}

extension View {
    func showExcludedItemsAsDisabled(_ show: Bool = true) -> some View {
        environment(\.showExcludedItemsAsDisabled, show)
    }
}
