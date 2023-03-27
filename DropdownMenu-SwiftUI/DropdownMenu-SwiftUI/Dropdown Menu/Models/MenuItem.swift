//
//  MenuItem.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/14/23.
//

import SwiftUI

struct MenuItem: Identifiable, Equatable {
    var id: UUID
    let title: String
    let subtext: String?
    let iconName: String?
    let tint: Color?
    
    init(
        id: UUID = UUID(),
        title: String,
        subtext: String? = nil,
        iconName: String? = nil,
        tint: Color? = nil
    ) {
        self.id = id
        self.title = title
        self.subtext = subtext
        self.iconName = iconName
        self.tint = tint
    }
}

extension MenuItem {
    var hasSubtext: Bool {
        subtext != nil
    }
}

#if DEBUG
extension MenuItem {
    static var mockMenuItems: [Self] {
        [
            .mockMenuItem,
            .init(title: "What street did you grow up on?", iconName: "house"),
            .init(title: "What is your favorite book?", iconName: "book")
        ]
    }
    
    static let mockMenuItem: Self = .init(
        title: "What is your favorite place to travel?",
        iconName: "airplane.departure"
    )
}
#endif
