//
//  MenuItem.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/14/23.
//

import Foundation

struct MenuItem: Identifiable, Equatable {
    var id: UUID
    let title: String
    let iconName: String?
    
    init(id: UUID = UUID(), title: String, iconName: String? = nil) {
        self.id = id
        self.title = title
        self.iconName = iconName
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
