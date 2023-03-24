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
    @State private var selectedItem: MenuItem?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if let selectedItem {
                    Text(selectedItem.title)
                } else {
                    Text("Choose an option")
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(expanded ? -180 : 0))
            }
            .padding(.vertical)
            .padding(.horizontal, 16)
            .border(.red)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()) { expanded.toggle() }
            }
            
            if expanded {
                VStack(spacing: 3) {
                    ForEach(menuItems) { item in
                        MenuItemRow(item: item, selectedItem: $selectedItem)
                    }
                }
                .padding(.vertical, 6)
            }
        }
        .onChange(of: selectedItem) { _ in
            withAnimation(.spring(
                response: 0.4,
                dampingFraction: 1.0,
                blendDuration: 0.8
            )) {
                expanded.toggle()
            }
        }
        .border(.red)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(menuItems: MenuItem.mockMenuItems)
    }
}
