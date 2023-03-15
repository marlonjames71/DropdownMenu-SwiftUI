//
//  DropdownMenu.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 3/14/23.
//

import SwiftUI

struct DropdownMenu: View {
    
    let menuItems: [MenuItem]
    
    @State private var expanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Choose an option")
                Spacer()
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(expanded ? 90 : 0))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation { expanded.toggle() }
            }
            
            if expanded {
                ForEach(menuItems) { item in
                    Text(item.title)
                }
            }
        }
        .padding()
        .border(.red)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(menuItems: MenuItem.mockMenuItems)
    }
}
